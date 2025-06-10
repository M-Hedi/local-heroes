class Event < ApplicationRecord
  belongs_to :store
  has_many :event_partners
  has_many :event_products
  has_many :users, through: :event_participants
  has_many :products, through: :event_products
  has_many :stores, through: :event_partners


  include PgSearch::Model
    multisearchable against: [:title, :description]


  pg_search_scope :search_by_title_and_description,
  against: [ :title, :description ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
