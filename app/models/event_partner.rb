class EventPartner < ApplicationRecord
  belongs_to :store
  belongs_to :event
end
