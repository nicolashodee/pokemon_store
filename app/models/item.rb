class Item < ApplicationRecord
  has_many :join_table_item_cart
  has_many :carts, through: :join_table_item_cart
  has_many :join_table_order_item
  has_many :orders, through: :join_table_order_item
  has_one_attached :picture

  validates :title,
    presence: true,
    length: {in: 3..40}
  validates :description,
    presence: true
  validates :price,
    presence: true,
    format: { with: /\A\d+(?:\.\d{0,2})?\z/, message: "n'est pas au bon format !"},
    numericality: { greater_than: 0, less_than: 1000 }
end
