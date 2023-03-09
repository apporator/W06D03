class ArtworkSharesController < ApplicationController

    def create
        artworkshare = ArtworkShare.new(artwork_shares_params)

        if artworkshare.save
            render json: artworkshare
        else
            render json: artworkshare.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        artshare = find_as_by_id(params[:id])

        if artshare && artshare.destroy
            render json: artshare
        elsif artshare
            render json: artworkshare.errors.full_messages, status: :unprocessable_entity
        end
    end

    def index 
        render json: ArtworkShare.all
    end


    private
    def artwork_shares_params
        params.require(:artwork_share).permit(:artwork_id, :viewer_id)
    end

    def find_as_by_id(as_id)

        artshare = ArtworkShare.find_by(id: as_id)

        return artshare if artshare
        render plain: "Sorry, share not found :(!)", status: :not_found
        return false

    end

end