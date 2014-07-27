class UserMailer < ActionMailer::Base
  default :from => "chris@massolit.io"

  def expire_email(user)
    mail(:to => user.email, :subject => "Subscription Cancelled")
  end

   def password_reset(user, password)
    @user = user
    @password = password
    mail(:to => user.email,
         :subject => 'MASSOLIT: New Password')
  end

end