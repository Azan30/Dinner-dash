# frozen_string_literal: false

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :fullname, null: false
      t.string :display_name, limit: 32
      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
