class Order < ApplicationRecord
  belongs_to :user
  has_many :items
  validates :status_store, presence: true, inclusion: { in: ['pending', 'accepted', 'refused'] }
  validates :status_customer, presence: true, inclusion: { in: ['pending', 'validated', 'canceled'] }
end
