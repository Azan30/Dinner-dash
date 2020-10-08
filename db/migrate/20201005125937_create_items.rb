class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title, null: false, unique: true
      t.string :description, null: false
      t.decimal :price, null: false

      t.timestamps
    end
  end
end
