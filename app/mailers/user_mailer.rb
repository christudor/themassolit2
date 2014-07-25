class UserMailer < ActionMailer::Base
  default :from => "chris@massolit.io"

  def expire_email(user)
    mail(:to => user.email, :subject => "Subscription Cancelled")
  end
end