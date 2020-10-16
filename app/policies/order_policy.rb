# frozen_string_literal: true

class OrderPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :order

    def initialize(user, order)
      @user = user
      @order = order
    end

    def resolve
      if user.admin?
        order.all
      else
        user.orders
      end
    end
  end
end
