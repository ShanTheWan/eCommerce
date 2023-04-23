class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :brand
      t.string :model
      t.text :description
      t.string :condition
      t.string :title
      t.decimal :price, precision: 5, scale: 2, defualt: 0

      t.timestamps
    end
  end
end
