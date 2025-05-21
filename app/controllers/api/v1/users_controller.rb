class Api::V1::UsersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    
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

    def record_not_found(error)
        render json: { error: error.message }, status: :not_found
    end
    
end