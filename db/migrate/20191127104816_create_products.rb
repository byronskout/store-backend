class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :brand
      t.decimal :price
      t.integer :stock_level

      t.timestamps
    end
  end
end
