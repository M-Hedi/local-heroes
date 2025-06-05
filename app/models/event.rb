class Event < ApplicationRecord
  belongs_to :store

  include PgSearch::Model
    multisearchable against: [:title, :description]


  pg_search_scope :search_by_title_and_description,
  against: [ :title, :description ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }



end

  # associated_against: {
  #   store: [ :name]
  # },
