class ApplicationController < ActionController::API
    def current_user
      return @current_user if @current_user
  
      auth_header = request.headers['Authorization']
      return nil unless auth_header.present?
  
      token = auth_header.split(' ').last
      return nil if token.blank?  # prevent split from breaking
  
      begin
        decoded = JWT.decode(token, Rails.application.secret_key_base)[0]
        @current_user = User.find(decoded["user_id"])
      rescue JWT::DecodeError, ActiveRecord::RecordNotFound
        nil
      end
    end
  end
  
  