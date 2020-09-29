# frozen_string_literal: false

class CreateWelcomes < ActiveRecord::Migration[5.2]
  def change
    create_table :welcomes, &:timestamps
  end
end
