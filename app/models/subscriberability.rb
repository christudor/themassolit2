class SubscriberAbility
  include CanCan::Ability

  def initialize(subscriber)
    subscriber ||= Subscriber.new # guest user (not logged in)
    if subscriber.has_role? :admin
      can :manage, :all
    else
      can :view, :silver if subscriber.has_role? :silver
      can :view, :gold if subscriber.has_role? :gold
      can :view, :platinum if subscriber.has_role? :platinum
    end
  end
end