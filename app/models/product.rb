class Product < ApplicationRecord
  has_many :order_items
  has_one_attached :image

  def self.ransackable_associations(auth_object = nil)
    ["order_items"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["name", "description", "price", "weight", "cake_type", "created_at", "updated_at"]
  end
end