class Store < ApplicationRecord
  belongs_to :user
  has_many :products
  has_many :event_partners
  has_many :events, through: :event_partners
  has_many :orders

  include PgSearch::Model

  multisearchable against: [:name, :category]

  pg_search_scope :search_by_name_and_category,
    against: [ :name, :category ],
    using: {
      tsearch: { prefix: true,  dictionary: "simple" } # <-- now `superman batm` will return something!
    }
end
