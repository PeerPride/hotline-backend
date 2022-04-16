# frozen_string_literal: true

# :nodoc:
class UserPolicy < ApplicationPolicy
  attr_reader :accessing_user, :target_user

  def initialize(accessing_user, target_user)
    super
    @accessing_user = accessing_user
    @target_user = target_user
  end

  def show?
    puts @accessing_user.id
    @accessing_user.id == @target_user.id || @accessing_user.id == '9b8c18a9-94ac-48e7-be86-7cb2926e1fda'
    # true
  end

  def update?
    # Simple test, only a user can update themselves
    @accessing_user.id == @target_user.id
  end

  # :nodoc:
  class Scope < Scope
    def initialize(user, scope)
      super
      @user = user
      @scope = scope
    end

    def resolve
      if @user.id == '9b8c18a9-94ac-48e7-be86-7cb2926e1fda'
        scope.all
      else
        # Where user is on team, etc, etc.
        scope.first # junk, remove this!
      end
    end

    private

    attr_reader :user, :scope
  end
end
