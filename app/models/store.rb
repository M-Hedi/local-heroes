class Store < ApplicationRecord
  belongs_to :user
  has_many :products
  has_many :events

  include PgSearch::Model

  multisearchable against: [:name, :category]

  pg_search_scope :search_by_name_and_category,
    against: [ :name, :category ],
    using: {
      tsearch: { prefix: true,  dictionary: "simple" } # <-- now `superman batm` will return something!
    }
end
