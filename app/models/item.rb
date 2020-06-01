class Item < ApplicationRecord
  validates :title,
  presence: true,
  length: {in: 5..40}
validates :description,
  presence: true
validates :price,
  presence: true,
  format: { with: /\A\d+(?:\.\d{0,2})?\z/, message: "n'est pas au bon format !"},
  numericality: { greater_than: 0, less_than: 1000 }
end
