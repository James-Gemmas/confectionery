ActiveAdmin.register Order do
  config.filters = false

  permit_params :delivery_date, :status, :total_price, :user_id
end