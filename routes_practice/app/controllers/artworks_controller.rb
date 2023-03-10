class ArtworksController < ApplicationController
    
    def index
        user = find_user_by_id(params[:user_id])

        if user
            render json: Artwork.artworks_for_user_id(user.id)
        end
    end

    def show
        artwork = find_by_artwork_id(params[:id])
        # debugger
        if artwork
            render json: artwork
        end
    end

    def update
        artwork = find_by_artwork_id(params[:id])
        if artwork
            artwork.title = artwork_params[:title] if artwork_params[:title]
            artwork.image_url = artwork_params[:image_url] if artwork_params[:image_url]
            artwork.artist_id = artwork_params[:artist_id] if artwork_params[:artist_id]
            if artwork.save
                render json: artwork 
            else
                render json: artwork.errors.full_messages, status: :unprocessable_entity
            end
        end
    end

    def destroy
        artwork = find_by_artwork_id(params[:id])

        if artwork && artwork.destroy
            render json: artwork
        elsif artwork
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def create
        artwork = Artwork.new(artwork_params)

        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end