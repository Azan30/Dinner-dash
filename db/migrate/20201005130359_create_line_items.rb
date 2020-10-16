# frozen_string_literal: true

class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.references :order
      t.references :item
      t.timestamps
    end
  end
end
