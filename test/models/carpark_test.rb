require 'test_helper'

class CarparkTest < ActiveSupport::TestCase
  test 'should not save empty carpark' do
    c = Carpark.new

    c.save
    refute c.valid?
  end

  test 'should save valid carpark' do
    c = Carpark.new

    c.name = 'Carpark Name'
    c.address = 'Carpark Address'

    c.save
    assert c.valid?
  end

  test 'should not save duplicate carpark name' do
    c1 = Carpark.new
    c1.name = 'Carpark1'
    c1.address = 'Address'
    c1.save
    assert c1.valid?
    
    c2 = Carpark.new
    c2.name = 'Carpark1'
    c2.address = 'Address'
    c2.save
    refute c2.valid?
  end

end
