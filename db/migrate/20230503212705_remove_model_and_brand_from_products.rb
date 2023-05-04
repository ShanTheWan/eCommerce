class RemoveModelAndBrandFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :model, :string
    remove_column :products, :brand, :string
  end
end
