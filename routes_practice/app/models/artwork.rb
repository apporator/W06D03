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
    # validates  [:artist_id, :title], uniqueness: true
end
