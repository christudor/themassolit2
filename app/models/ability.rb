class Ability
  include CanCan::Ability

  def initialize(user)

    if user.rolable_type == "Admin"
      can :manage, :all
    else
      
    # Paid subscriber permissions

    can :view, :lesson if user.rolable_type == "Member"
    can :view, :course if user.rolable_type == "Member"

    # Teacher permissions

    can :view, :lesson if user.rolable_type == "Teacher"
    can :view, :course if user.rolable_type == "Teacher"

    # Student permissions

    can :view, :lesson if user.rolable_type == "Student"
    can :view, :course if user.rolable_type == "Student"

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