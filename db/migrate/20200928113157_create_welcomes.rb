# frozen_string_literal: true

class CreateWelcomes < ActiveRecord::Migration[5.2]
  def change
    create_table :welcomes, &:timestamps
  end
end
