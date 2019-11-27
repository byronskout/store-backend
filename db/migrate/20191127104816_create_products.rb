class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :brand
      t.decimal :price, precision: 5, scale: 2, default: 0
      t.integer :stock_level

      t.timestamps
    end
  end
end
