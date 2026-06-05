ActiveAdmin.register Product do
  permit_params :name, :description, :price, :weight, :cake_type, :image

  filter :name
  filter :price
  filter :weight
  filter :cake_type

  index do
    selectable_column
    id_column
    column :name
    column :price
    column :weight
    column :cake_type
    column :image do |product|
      image_tag product.image.variant(resize_to_limit: [50, 50]) if product.image.attached?
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :price
      f.input :weight
      f.input :cake_type
      f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :price
      row :weight
      row :cake_type
      row :image do |product|
        image_tag product.image if product.image.attached?
      end
    end
  end
end