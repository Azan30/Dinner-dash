# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :user, dependent: :destroy

  has_many :line_items, dependent: :destroy

  def add(item)
    if user.orders.empty?
      @order = user.orders.create(status: 'Pending', bill: 2)
      LineItem.create({ item: item, order: @order, cart: self })
    else
      @order = user.orders.take
      LineItem.create({ item: item, order: @order, cart: self })
    end
  end

  def remove(item)
    @order = user.orders.take
    @line_item = LineItem.find_by({item: item, order: @order, cart: self})
    @line_item.destroy!
  end
end
