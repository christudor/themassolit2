class SubscriberAbility
  include CanCan::Ability

  def initialize(subscriber)
    subscriber ||= Subscriber.new # guest user (not logged in)
    if subscriber.has_role? :admin
      can :manage, :all
    else
      can :view, :silver if subscriber.has_role? :validstudent
      can :view, :gold if subscriber.has_role? :validstudent
      can :view, :platinum if subscriber.has_role? :validteacher
    end
  end
end