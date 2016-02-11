class Ability
  include CanCan::Ability

  def initialize(user)
    case
    when user.admin?
      can :manage, :all
    when user.user?
      can [:read, :create], :all
      can [:update, :destroy], TaskList, user_id: user.id
      can [:update, :destroy], Task, task_list: { user_id: user.id }
    else
      can :read, :all
    end
  end
end
