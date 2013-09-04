class UserMailer < ActionMailer::Base
  default :from => "chris@massolit.co.uk"

  def expire_email(user)
    mail(:to => user.email, :subject => "Subscription Cancelled")
  end
end