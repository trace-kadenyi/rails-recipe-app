# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    return unless user.present?

    can :read, Recipe, public: true

    can :manage, Recipe, user_id: user.id
   
  end
end