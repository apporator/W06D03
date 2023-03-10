# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :text             not null
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :artist_id, :title, presence: true
    validates :image_url, presence: true, uniqueness:true
    validates :artist_id, uniqueness: {scope: :title, message: "Combination of artist and title must be unique!"}
    

    belongs_to :artist,
        class_name: :User,
        foreign_key: :artist_id

    has_many :connections,
        class_name: :ArtworkShare,
        foreign_key: :artwork_id,
        dependent: :destroy
    
    has_many :shared_viewers,
        through: :connections,
        source: :viewer
    
    def self.artworks_for_user_id(id)
        Artwork
        .select("artworks.*")
        .left_outer_joins(:connections)
        .where('(artworks.artist_id = :user_id) or (artwork_shares.viewer_id = :user_id)', user_id: id)
        # .joins(:shared_viewers)
        # .joins(:artist)
        # .where("users.id = 4 or artists_artworks.id = 4")
    end
end

# artists_artworks