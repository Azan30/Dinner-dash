class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :status, null: false, default: 0
      t.decimal :bill, null: false, precision: 8

      t.timestamps
    end
  end
end
