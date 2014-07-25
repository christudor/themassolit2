class Mailchimp < ActiveRecord::Base

def subscribe
	Gibbon::API.new(ENV['MAILCHIMP_API']).lists.subscribe({:id => ENV['MAILCHIMP_LIST_ID'],
		:email => {:email => params[:email]}, :double_optin => false})
	rescue Gibbon::MailChimpError => e
  	return redirect_to root_path, :flash => { error: e.message }
end

end