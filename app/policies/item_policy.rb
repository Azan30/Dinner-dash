# frozen_string_literal: true

class ItemPolicy < ApplicationPolicy
  attr_reader :user, :item

  def initialize(user, item)
    @user = user
    @item = item
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    if user.present?
      user.admin?
    end
  end

  def new?
    if user.present?
      user.admin?
    end
  end

  def update?
    user.admin?
  end

  def edit?
    if user.present?
      user.admin?
    end
  end

  def destroy?
    if user.present?
      user.admin?
    end
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
