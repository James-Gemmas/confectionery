class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  def self.ransackable_attributes(auth_object = nil)
    ["quantity", "price_at_time", "created_at", "updated_at", "order_id", "product_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["order", "product"]
  end
end