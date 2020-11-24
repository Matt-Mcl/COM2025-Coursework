class Ticket < ApplicationRecord
  belongs_to :space
  validates :space, :registration_number, :paid_from, :paid_to, presence: true

  before_save :calculate_total_cost

  <<-TESTS
    puts '---------------------------------------------------------------------'
    puts start_time
    puts end_time
    puts registration_number
    puts @ticket_space.hourly_cost
    puts (end_time - start_time) / 3600.0
    puts ((end_time - start_time) / 3600.0) * @ticket_space.hourly_cost
  TESTS
  def calculate_total_cost
    start_time = Time.parse(paid_from.strftime('%FT%R'))
    end_time = Time.parse(paid_to.strftime('%FT%R'))
    @ticket_space = Space.find(space_id)
    self.total_cost = ((end_time - start_time) / 3600.0) * @ticket_space.hourly_cost
  end
end
