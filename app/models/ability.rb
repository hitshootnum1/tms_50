class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.supervisor?
      can :manage, :all
    elsif user.trainee?
      can :read, :all
    end
  end
end
