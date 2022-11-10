# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    #  user ||= User.new # guest user (not logged in)
    # can :read, Recipe do |recipe|
    #   recipe.user == user || recipe.public
    # end
    # return unless user.present?

    # can :read, Recipe, public: true

    # can :manage, Recipe, user_id: user.id
   
  end
end
