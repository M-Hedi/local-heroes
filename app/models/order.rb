class Order < ApplicationRecord
  belongs_to :user
  belongs_to :store
  has_many :items
  has_many :products, through: :items
  validates :status_store, presence: true, inclusion: { in: ['pending', 'accepted', 'refused'] }
  validates :status_customer, presence: true, inclusion: { in: ['pending', 'validated', 'canceled'] }
end
