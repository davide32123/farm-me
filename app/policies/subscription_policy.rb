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
    if record.basket
      record.basket.user != user
    else
      true
    end
  end

  def update?
    record.basket.user == user || record.user == user
  end
end
