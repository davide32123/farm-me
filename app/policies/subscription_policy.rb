class SubscriptionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    record.user == user
  end

  def create?
    record.basket.user != user
  end

  def update?
    record.basket.user == user || record.user == user
  end
end
