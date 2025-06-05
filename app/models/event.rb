class Event < ApplicationRecord
  belongs_to :store
  has_many :event_partners
end
