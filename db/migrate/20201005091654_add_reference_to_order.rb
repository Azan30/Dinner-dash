# frozen_string_literal: true

class AddReferenceToOrder < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :user, foreign_key: true
  end
end
