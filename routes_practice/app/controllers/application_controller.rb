class ApplicationController < ActionController::Base

    def find_by_artwork_id(artwork_id)
        artwork = Artwork.find_by(id: artwork_id)
        return artwork if artwork

        render plain: "404 not found", status: :not_found
        return false
    end

    def find_user_by_id(user_id)
        user = User.find_by(id: user_id)

        return user if user
        render plain: "404 Not Found", status: :not_found
        return false
    end
end
