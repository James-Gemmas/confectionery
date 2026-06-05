class AddWeightAndCakeTypeToProducts < ActiveRecord::Migration[8.1]
  def change
    add_column :products, :weight, :string
    add_column :products, :cake_type, :string
  end
end
