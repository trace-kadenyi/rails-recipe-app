class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :read, Recipe, &:public
    can :manage, Recipe do |recipe|
      recipe.user == user
    end
    can :read, Food
    can :manage, Food do |food|
      food.user == user
    end
  end
end
