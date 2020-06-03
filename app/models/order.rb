class Order < ApplicationRecord
  belongs_to :user
  has_many :join_table_order_item
  has_many :items, through: :join_table_order_item
end
