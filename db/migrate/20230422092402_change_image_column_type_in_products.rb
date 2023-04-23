class ChangeImageColumnTypeInProducts < ActiveRecord::Migration[7.0]
  def up
    change_column :products, :image, :json, using: 'image::json'
  end

  def down
    change_column :products, :image, :string
  end
end
