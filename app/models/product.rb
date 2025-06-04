class Product < ApplicationRecord
  belongs_to :store
  has_many :items
  validates :name, presence: true, length: { maximum: 100 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :category, presence: true
  validates :discount, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }, allow_nil: true
  validates :stock, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :loyalty_price, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :status, presence: true, inclusion: { in: ['available', 'unavailable'] }
  validates :desciption, length: { maximum: 500 }, allow_blank: true
  validates :store_id, presence: true
end
