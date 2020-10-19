# frozen_string_literal: true

class AddIndexes < ActiveRecord::Migration[5.2]
  def change
    add_index :cart_items, :quantity
    add_index :items, :availability
  end
end
