require 'test_helper'

class SpaceTest < ActiveSupport::TestCase

  setup do
    @carpark = carparks(:one)
  end

  test 'should not save empty space' do
    s = Space.new

    s.save
    refute s.valid?
  end

  test 'should save valid space' do
    s = Space.new

    s.space_number = '1'
    s.hourly_cost = '1.50'
    s.carpark = @carpark

    s.save
    assert s.valid?
  end

end
