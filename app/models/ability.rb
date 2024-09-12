# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    return unless user.persisted? # Check if the user is logged in

    can :create, Comment # Allow creating comments
    can :read, Comment # Allow reading comments
    can :update, Comment, user_id: user.id # Allow editing comments created by the user
    can :destroy, Comment, user_id: user.id # Allow deleting comments created by the user

    can :destroy, ToDo if user.role == 'admin'
    can :destroy, ToDoList if user.role == 'admin'
  end
end
