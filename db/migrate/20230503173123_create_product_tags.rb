class CreateProductTags < ActiveRecord::Migration[7.0]
  def change
    create_table :product_tags do |t|
      t.string :name

      t.timestamps
    end

    create_table :product_tags_products, id: false do |t|
      t.belongs_to :product_tag
      t.belongs_to :product
    end

    add_index :product_tags_products, [:product_tag_id, :product_id]
  end
end
