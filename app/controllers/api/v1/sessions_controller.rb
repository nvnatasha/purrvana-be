class Api::V1::SessionsController < ApplicationController

    def index
        sessions = Session.all
        render json: SessionSerializer.format_sessions(sessions)
    end

    def show
        session = Session.find(params[:id])
        render json: SessionSerializer.format_session(session)
    end

    private

    def session_params
        params.require(:session).permit(:duration_seconds, :started_at)
    end

end