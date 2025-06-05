class Event < ApplicationRecord
  include PgSearch::Model
  belongs_to :store

pg_search_scope :global_search,
  against: [ :title, :description ],
  associated_against: {
    store: [ :name]
  },
  using: {
    tsearch: { prefix: true }
  }

end
