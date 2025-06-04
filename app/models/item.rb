class Item < ApplicationRecord
  belongs_to :product
  belongs_to :order
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :product, presence: true
  validates :order, presence: true
end
