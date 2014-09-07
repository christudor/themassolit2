class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :user_type

  belongs_to :rolable, :polymorphic => true

  after_create do
    subscribe_to_mailchimp
  end

  def student?
    if user_type == 'student'
      true
    end
  end

  def teacher?
    if user_type == 'teacher'
      true
    end
  end

  def member?
    if user_type == 'member'
      true
    end
  end

  def admin?
    if user_type == 'admin'
      true
    end
  end

  def update_stripe
    if customer_id.nil?
    else
      customer = Stripe::Customer.retrieve(customer_id)
      if stripe_token.present?
        customer.card = stripe_token
      end
      customer.save
    end
    self.last_4_digits = customer.cards.data.first.last4
    self.customer_id = customer.id
    self.stripe_token = nil
  rescue Stripe::StripeError => e
    logger.error "Stripe Error: " + e.message
    errors.add :base, "#{e.message}."
    self.stripe_token = nil
    false
  end

  def cancel_subscription
    unless customer_id.nil?
      customer = Stripe::Customer.retrieve(customer_id)
      unless customer.nil? or customer.respond_to?('deleted')
        if customer.subscription == 'active'
          customer.cancel_subscription
        elsif customer.subscription == 'trialing'
          customer.cancel_subscription
        end
      end
    end
  rescue Stripe::StripeError => e
    logger.error "Stripe Error: " + e.message
    errors.add :base, "Unable to cancel your subscription. #{e.message}."
    false
  end

  def expire
    UserMailer.expire_email(self).deliver
    destroy
  end

  def subscribe_to_mailchimp testing=false
    return true if (Rails.env.test? && !testing)
    list_id = ENV['MAILCHIMP_LIST_ID']

    response = Rails.configuration.mailchimp.lists.subscribe({
      id: list_id,
      email: {email: email},
      double_optin: false,
    })
  response
end

end