# frozen_string_literal: true

class AvaliationPolicy < ApplicationPolicy
  def create?
    user.role_administrator?
  end

  def new?
    user.role_administrator?
  end

  def edit?
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
      if user.role_administrator?
        scope.all
      else
        user.given_avaliations
      end
    end
  end
end
