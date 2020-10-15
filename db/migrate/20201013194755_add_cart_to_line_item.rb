# frozen_string_literal: true

class AddCartToLineItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :line_items, :cart, foreign_key: true
  end
end
