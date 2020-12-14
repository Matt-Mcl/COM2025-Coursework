class Ticket < ApplicationRecord
  before_save :find_space
  before_save :calculate_total_cost

  belongs_to :space, optional: true
  validates :registration_number, :paid_from, :paid_to, presence: true
  validate :validate_dates

  # Method used to take in the carpark provided by the form
  # and return the next available space
  def find_space
    return unless Carpark.find_by_id(space_id)

    @ticket_carpark = Carpark.find_by_id(space_id)
    @spaces = @ticket_carpark.spaces
    @overlap = false
    @spaces.each do |space|
      @space_tickets = Ticket.where(space_id: space.id).all
      @space_tickets.each do |ticket|
        if (Time.parse(ticket.paid_from.strftime('%FT%R'))..Time.parse(ticket.paid_to.strftime('%FT%R')) - 1.minute).overlaps?(Time.parse(paid_from.strftime('%FT%R'))..Time.parse(paid_to.strftime('%FT%R')) - 1.minute)
          @overlap = true
        end
      end
      unless @overlap
        @new_space_id = space.id
        break
      end
      @overlap = false
    end
    puts @new_space_id
    self.space_id = @new_space_id
  end

  # Method used to calculate the cost for the given space
  # provided the time staying
  def calculate_total_cost
    start_time = Time.parse(paid_from.strftime('%FT%R'))
    end_time = Time.parse(paid_to.strftime('%FT%R'))
    @ticket_space = Space.find(space_id)
    self.total_cost = ((end_time - start_time) / 3600.0) * @ticket_space.hourly_cost
  end

  def validate_dates
    return if paid_to.nil? || paid_from.nil?

    # If ending date is before start date
    errors.add(:paid_to, I18n.t('error.ending_before_start')) if paid_to < paid_from
    # If parking time isn't greater than zero
    errors.add(:base, I18n.t('error.time_greater_than_zero')) if (paid_from - paid_to).zero?
    # If starting date is in the past - don't need to check ending time as this would mean
    # it comes before the starting time, raising a different error.
    errors.add(:paid_from, I18n.t('error.starting_time_in_past')) if paid_from.present? && paid_from < Date.today
  end

end
