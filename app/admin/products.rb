ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :description, :title, :price, :image, :user_id, :product_tag_ids => []

   form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :price
      f.input :image
      f.input :user_id
      f.input :product_tags, as: :check_boxes, collection: ProductTag.all.map { |product_tag| [product_tag.name, product_tag.id] }
    end
    f.actions
  end



index do
    selectable_column
    id_column
    column :title
    column :description
    column :price
    column :image
    column :user_id
    column :product_tags do |product|
      product.product_tags.map { |product_tag| product_tag.name }.join(", ").html_safe
    end
    actions
  end
  
 
  collection_action :import, method: :get do
    render 'admin/import_csv'
  end

  collection_action :import_csv, method: :post do
    if params[:csv_file].present?
    csv_data = params[:csv_file].read.force_encoding("UTF-8")
    sanitized_csv = csv_data.encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')
    csv_json = CSV.parse(sanitized_csv, headers: true, col_sep: ';').map(&:to_h).to_json
    products = JSON.parse(csv_json)
    
    Product.create(products)
    redirect_to collection_path, notice: "#{products.count} products imported successfully!"
  else
    redirect_to collection_path, alert: "No CSV file selected!"
  end
  end

  action_item :import_csv, only: :index do
    link_to 'Import CSV', import_admin_products_path
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:brand, :model, :description, :condition, :title, :price, :image, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
