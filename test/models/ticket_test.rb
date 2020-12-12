require 'test_helper'

class TicketTest < ActiveSupport::TestCase

  setup do
    @space = spaces(:space_one)
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
    ticket.paid_from = '7020-11-24 17:00:00'
    ticket.paid_to = '7020-11-24 20:00:00'

    ticket.save
    assert ticket.total_cost == @space.hourly_cost * 3
    assert ticket.valid?
  end

  test 'Should error zero parking time' do
    ticket = Ticket.new

    ticket.space = @space
    ticket.registration_number = 'TY67 UTG'
    ticket.paid_from = '7020-11-24 10:00:00'
    ticket.paid_to = '7020-11-24 10:00:00'

    ticket.save
    refute ticket.valid?
  end

  test 'Should error less than zero parking time' do
    ticket = Ticket.new

    ticket.space = @space
    ticket.registration_number = 'TY67 UTG'
    ticket.paid_from = '7020-11-24 16:00:00'
    ticket.paid_to = '7020-11-24 10:00:00'

    ticket.save
    refute ticket.valid?
  end

  test 'Should error starting time in the past' do
    ticket = Ticket.new

    ticket.space = @space
    ticket.registration_number = 'TY67 UTG'
    ticket.paid_from = '2011-11-24 10:00:00'
    ticket.paid_to = '7020-11-24 12:00:00'

    ticket.save
    refute ticket.valid?
  end

end
