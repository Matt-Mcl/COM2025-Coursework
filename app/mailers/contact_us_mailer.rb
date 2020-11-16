class ContactUsMailer < ApplicationMailer
  def contact_email(email, name, phone, query)
    @email = email
    @name = name
    @phone = phone
    @query = query
    mail cc: @email
  end
end
