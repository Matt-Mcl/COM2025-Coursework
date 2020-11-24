require 'test_helper'

class TicketTest < ActiveSupport::TestCase

  setup do
    @space = spaces(:one)
  end

  test 'Should not save empty ticket' do
    ticket = Ticket.new

    ticket.save
    refute ticket.valid?
  end

  test 'Should save valid ticket' do
    ticket = Ticket.new

    ticket.space = @space
    ticket.registration_number = 'TY67 UTG'
    ticket.paid_from = '2020-11-24 17:00:00'
    ticket.paid_to = '2020-11-24 20:00:00'

    ticket.save
    assert ticket.total_cost == @space.hourly_cost * 3
    assert ticket.valid?
  end

end
