# frozen_string_literal: true

class OrderPolicy < ApplicationPolicy
  attr_reader :user, :order

  def initialize(user, order)
    @user = user
    @order = order
  end

  def index?
    true
  end

  def show?
    return true if user.admin?

    user.orders.find_by(id: @order.id).present?
  end

  def update?
    user.admin?
  end

  def edit?
    user.admin?
  end

  def destroy?
    true
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if !user.nil?
        if user.admin?
          scope.all
        else
          user.orders
        end
      end
    end
  end
end
