class Artwork < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: { scope: :artist_id }

    belongs_to :artist,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :User

    has_many :shares, #SEEN BY 'X' PEOPLE 
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare

    has_many :shared_viewers,
        through: :shares,
        source: :viewer

end

#will return the set of users with whom an artwork has been shared.