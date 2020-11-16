class HomeController < ApplicationController
  def home
  end

  def contact
  end

  def request_contact
    name = params[:name]
    email = params[:email]
    phone = params[:phone]
    query = params[:query]
    if email.blank?
      flash[:alert] = I18n.t('home.request_contact.no_email')
    else
      ContactUsMailer.contact_email(email, name, phone, query).deliver_now
      flash[:notice] = I18n.t('home.request_contact.email_sent')
    end
    redirect_to root_path
  end
end
