class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

  def self.ransackable_associations(auth_object = nil)
    ["order_items", "user"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["delivery_date", "status", "total_price", "created_at", "updated_at", "user_id"]
  end
end