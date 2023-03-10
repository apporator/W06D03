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
        user = User.find_by(id: params[:id])
        puts user
        # debugger
        if user
            render json: user
        else
            render plain: "404 Not Found", status: :not_found
        end
    end

    def update
        user = User.find_by(id: params[:id])

        if user
            # debugger
            user.username = user_params[:username] || user.username
            user.save
            render json: user
        else
            render plain: "404 Not Found", status: :not_found
        end
    end

    

    def destroy 
        user = find_user_by_id(params[:id])
        
        if user
            user.destroy
            render json: user
        end
    end

    
    private
    def user_params
        params.require(:user).permit(:username)
    end

end



