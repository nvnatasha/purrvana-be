class Api::V1::AuthController < ApplicationController
    def create
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        token = JWT.encode({ user_id: user.id }, Rails.application.secret_key_base)
        render json: { token: token, user_id: user.id }, status: :ok
      else
        render json: { error: 'Invalid credentials' }, status: :unauthorized
      end
    end
  end 