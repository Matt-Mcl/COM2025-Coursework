# Preview all emails at http://localhost:3000/rails/mailers/contact_us_mailer
class ContactUsMailerPreview < ActionMailer::Preview
  def contact_email
    ContactUsMailer.contact_email("mm02417@surrey.ac.uk", "Matt",
         "1234567890", "Test")
  end
end
