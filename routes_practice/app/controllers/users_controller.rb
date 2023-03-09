class UsersController < ApplicationController
    def index
        render json: User.all
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: user 
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end        
    end

    def show
        user = User.find(params[:id])
        puts user
        debugger
        if user
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def update
        # user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:email, :name, :id)
    end

end