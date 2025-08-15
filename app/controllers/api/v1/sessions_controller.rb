class Api::V1::SessionsController < ApplicationController

    def index
        sessions = Session.all
        render json: SessionSerializer.format_sessions(sessions)
    end

    def show
        session = Session.find(params[:id])
        render json: SessionSerializer.format_session(session)
    end

    def create
        begin
            session = Session.create!(session_params)
          rescue => e
            puts "❌ Session creation failed: #{e.message}"
            return render json: { error: e.message }, status: :unprocessable_entity
          end
      
        user = session.user
        cat = session.cat
      
        UserCat.increment_usage_for(user, cat)
      
        render json: SessionSerializer.format_session(session), status: :created
      end
      
      

    private

    def session_params
        params.require(:session).permit(:user_id, :cat_id, :duration_seconds, :started_at)
    end

end