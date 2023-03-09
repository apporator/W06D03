# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
   validates :username, presence: true, uniqueness: true
   # validates :email, presence: true 

   has_many :artworks,
      class_name: :Artwork,
      foreign_key: :artist_id

   has_many :artwork_shares,
      class_name: :ArtworkShare,
      foreign_key: :viewer_id
   
   has_many :shared_artwork,
      through: :artwork_shares,
      source: :artwork

end

