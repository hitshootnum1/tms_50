class Ability
  include CanCan::Ability

  def initialize user, namespace
    user ||= User.new
    case namespace
      when "admin"
        can :manage, :all if user.supervisor?
      else
        if user.supervisor?
          can :manage, :all
        elsif user.trainee?
          can :read, UserCourse, user_id: user.id
          can :manage, User, id: user.id
          cannot :destroy, User
        else
          can :create, User
        end
    end
  end
end
