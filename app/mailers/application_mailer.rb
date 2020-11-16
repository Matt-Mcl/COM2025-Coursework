class ApplicationMailer < ActionMailer::Base
  default to: "queries@parking.com", from: 'queries@parking.com'
  layout 'mailer'
end
