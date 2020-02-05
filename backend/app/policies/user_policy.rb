# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def index?
    user.role_administrator?
  end

  def create?
    user.role_administrator?
  end

  def new?
    user.role_administrator?
  end

  def edit?
    user.role_administrator?
  end

  def show?
    user.role_administrator?
  end

  def update?
    user.role_administrator?
  end

  def destroy?
    user.role_administrator?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
