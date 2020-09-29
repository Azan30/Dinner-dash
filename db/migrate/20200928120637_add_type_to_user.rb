# frozen_string_literal: false

# To implement STI this Type column is added to the user table

class AddTypeToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :type, :string, null: false
  end
end
