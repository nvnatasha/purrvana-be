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
        session = Session.create!(session_params)
        render json: SessionSerializer.format_session(session), status: :created
    end

    private

    def session_params
        params.require(:session).permit(:user_id, :cat_id, :duration_seconds, :started_at, :ended_at)
    end

end