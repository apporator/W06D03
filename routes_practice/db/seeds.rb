# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.new(username: "Micheal").save!
User.new(username: "Bilal").save!
User.new(username: "Brandon").save!
User.new(username: "Michele").save!
User.new(username: "Christian").save!
User.new(username: "Leah").save!

Artwork.new(title: "Mona Lisa", image_url: "monalisa.com", artist_id: User.first.id).save!
Artwork.new(title: "Starry Night", image_url: "starrynight.com", artist_id: User.third.id).save!
Artwork.new(title: "The Last Supper", image_url: "lastsupper.com", artist_id: User.fourth.id).save!
Artwork.new(title: "Mona Lisa", image_url: "bettermonalisa.com", artist_id: User.last.id).save!

ArtworkShare.new(viewer_id: User.first.id, artwork_id: Artwork.last.id).save!
ArtworkShare.new(viewer_id: User.fourth.id, artwork_id: Artwork.first.id).save!
ArtworkShare.new(viewer_id: User.second.id, artwork_id: Artwork.second.id).save!