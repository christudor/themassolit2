class NotificationsMailer < ActionMailer::Base

  default :from => "website@massolit.io"
  default :to => "chris@massolit.io"

  def new_message(message)
    @message = message
    mail(:subject => "MASSOLIT: Website Contact Form")
  end

end