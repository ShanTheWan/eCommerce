class RemoveConditionFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :condition, :string
  end
end
