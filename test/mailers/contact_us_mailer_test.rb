require 'test_helper'

class ContactUsMailerTest < ActionMailer::TestCase

  test "should return contact email" do
    mail = ContactUsMailer.contact_email("mm02417@surrey.ac.uk","Matt",
                                       "1234567890", "Test")

    assert_equal ['queries@parking.com'], mail.to
    assert_equal ['queries@parking.com'], mail.from
  end
end
