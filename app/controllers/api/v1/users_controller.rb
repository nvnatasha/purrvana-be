class Api::V1::UsersController < ApplicationController

    def index
        users = User.all
        render json: UserSerializer.format_users(users)
    end

    def show
        user = User.find(params[:id])
        render json: UserSerializer.format_user(user)
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :cats, :sessions)
    end
    
end