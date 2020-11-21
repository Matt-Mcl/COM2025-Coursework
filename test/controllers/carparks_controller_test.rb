require 'test_helper'

class CarparksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @carpark = carparks(:one)
  end

  test "should get index" do
    get carparks_url
    assert_response :success
  end

  test "should get new" do
    get new_carpark_url
    assert_response :success
  end

  test "should create carpark" do
    assert_difference('Carpark.count') do
      post carparks_url, params: { carpark: { address: @carpark.address, name: @carpark.name } }
    end

    assert_redirected_to carpark_url(Carpark.last)
  end

  test "should show carpark" do
    get carpark_url(@carpark)
    assert_response :success
  end

  test "should get edit" do
    get edit_carpark_url(@carpark)
    assert_response :success
  end

  test "should update carpark" do
    patch carpark_url(@carpark), params: { carpark: { address: @carpark.address, name: @carpark.name } }
    assert_redirected_to carpark_url(@carpark)
  end

  test "should destroy carpark" do
    assert_difference('Carpark.count', -1) do
      delete carpark_url(@carpark)
    end

    assert_redirected_to carparks_url
  end
end
