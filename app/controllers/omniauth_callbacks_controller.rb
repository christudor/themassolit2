class OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def all
		subscriber = Subscriber.from_omniauth(request.env["omniauth.auth"])
		if subscriber.persisted?
			flash.notice = "Signed in!"
			sign_in_and_redirect subscriber
		else
			session["devise.subscriber_attributes"] = subscriber.attributes
			redirect_to new_subscriber_registration_url
		end
	end
	alias_method :twitter, :all
end
