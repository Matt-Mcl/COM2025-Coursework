class Ticket < ApplicationRecord
  before_save :find_space_id
  before_save :calculate_total_cost

  belongs_to :space, optional: true
  validates :registration_number, :paid_from, :paid_to, presence: true

  <<-TESTS
    puts '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&'
    puts space_id
    puts space
    @ticket_carpark = Carpark.find(space_id)
    @spaces = @ticket_carpark.spaces
    puts '^^^^^^^^^^^^'
    puts @spaces
    puts '^^^^^^^^^^^^'
    puts @spaces.where(space_number: 7)
    @new_id = @spaces.where(space_number: 7)
    puts @new_id.ids
    # self.space_id = @spaces.where(space_number: 23)
    # Ticket.where(id: self.id).update_all(space_id: @new_id.ids)
    # Ticket.where(id: self.id).update_all(['space_id = ?', @new_id.ids])
    @new_space_id = @new_id.ids.to_s.gsub(/\D/, '').to_i
    puts @new_space_id
    self.space_id = @new_space_id
    puts space_id
    puts '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&'
  TESTS
  def find_space_id
    @ticket_carpark = Carpark.find(space_id)
    @spaces = @ticket_carpark.spaces
    @new_space_id = @spaces.where(space_number: 1)
    self.space_id = @new_space_id.ids.to_s.gsub(/\D/, '').to_i
  end

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
