class Ability
  include CanCan::Ability

  def initialize(person)
    person ||= User.new # guest user (not logged in)
    if person.has_role? :admin
      can :manage, :all
    else
      
    # Paid subscriber permissions

    can :view, :gold if person.has_role? :gold
    can :view, :course if person.has_role? :gold

    # Student permissions

    can :view, :gold if person.has_role? :validstudent
    can :view, :course if person.has_role? :validstudent

    # Teacher permissions

    can :view, :platinum if person.has_role? :validteacher
    can :view, :course if person.has_role? :validteacher
    can :view, :school if person.has_role? :validteacher
    end
  end

  # def initialize(user)
  #  user ||= User.new # guest user (not logged in)
  #  if user.has_role? :admin
  #    can :manage, :all
  #  else
  #    can :view, :silver if user.has_role? :silver
  #    can :view, :gold if user.has_role? :gold
  #    can :view, :platinum if user.has_role? :platinum
  #  end
  # end

end