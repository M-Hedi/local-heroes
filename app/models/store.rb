class Store < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :products
  has_many :event_partners
  has_many :events
  has_many :orders

  include PgSearch::Model

  multisearchable against: [:name, :category]

  pg_search_scope :search_by_name_and_category,
    against: [ :name, :category ],
    using: {
      tsearch: { prefix: true,  dictionary: "simple" } # <-- now `superman batm` will return something!
    }
    
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
