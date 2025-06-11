class Product < ApplicationRecord
  has_one_attached :photo
  belongs_to :store
  has_many :items
  has_many :event_products
  has_many :events, through: :event_products

  validates :name, presence: true, length: { maximum: 100 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  # validates :category, presence: true
  # validates :discount, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }, allow_nil: true
  # validates :stock, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  # validates :loyalty_price, numericality: { greater_than_or_equal_to: 0 }
  # validates :status, presence: true, inclusion: { in: ['available', 'unavailable'] }
  validates :description, length: { maximum: 500 }

  def price
    if discount && discount.positive?
      discount
    else
      self[:price]
    end
  end

  def exact_price
    self[:price]
  end
end
