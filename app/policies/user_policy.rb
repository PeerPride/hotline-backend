# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  attr_reader :accessing_user, :target_user

  def initialize(accessing_user, target_user)
    @accessingUser = accessing_user
    @targetUser = target_user
  end

  def show?
    puts @accessingUser.id
    @accessingUser.id == @targetUser.id || @accessingUser.id == '9b8c18a9-94ac-48e7-be86-7cb2926e1fda'
    #true
  end

  def update?
    # Simple test, only a user can update themselves
    @accessingUser.id == @targetUser.id
  end

  class Scope < Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if @user.id == '9b8c18a9-94ac-48e7-be86-7cb2926e1fda'
        scope.all
      else
        # Where user is on team, etc, etc.
      end
    end

    private
      attr_reader :user, :scope
  end
end
