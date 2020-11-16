require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success
  end

  test "should get contact" do
    get contact_url
    assert_response :success

    assert_template layout: 'application'
  end

  test "should post request contact but fail email" do
    post request_contact_url

    assert_response :redirect
    assert_not_empty flash[:alert]
    assert_nil flash[:notice]
  end

  test "should post request contact successfully" do
    post request_contact_url, params:
        {name: "Matt", email: "mm02417@surrey.ac.uk",
         phone:"1234567890", query:"Test"}

    assert_response :redirect
    assert_not_empty flash[:notice]
    assert_nil flash[:alert]
  end

end
