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

    # def me
    #     render json: UserSerializer.format_user(current_user)
    # end
    
    def me
      if current_user
        render json: UserSerializer.format_user(current_user)
      else
        render json: { error: "No current user" }, status: :unauthorized
      end
    end
    

    def create
      user = User.new(user_params)
      if user.save
        token = JWT.encode({ user_id: user.id }, Rails.application.secret_key_base)
    
        render json: {
          token: token,
          data: {
            id: user.id.to_s,
            type: 'user',
            attributes: {
              name: user.name,
              email: user.email
            }
          }
        }, status: :created
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
    

    private 

    def user_params
        params.require(:user).permit(:name, :email, :password, :cats, :sessions)
    end

    def record_not_found(error)
        render json: { error: error.message }, status: :not_found
    end

    def authorize!
      return if current_user
    
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
    
end