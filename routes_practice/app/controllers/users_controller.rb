class UsersController < ApplicationController
    def index
        render json: User.all
    end

    def create
        user = User.new(params.require(:user).permit(:email, :name))
        user.save!
        render json: params
    end

    def show
        render json: params
    end

end