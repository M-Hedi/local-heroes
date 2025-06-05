class Event < ApplicationRecord
  belongs_to :store
  has_many :event_partners
  has_many :event_products
end
