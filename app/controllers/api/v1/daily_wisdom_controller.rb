class Api::V1::DailyWisdomController < ApplicationController

    def index
        wisdoms = DailyWisdom.all
        render json: DailyWisdomSerializer.format_wisdoms(wisdoms)
    end

    def show
        wisdom = DailyWisdom.find(params[:id])
        render json: DailyWisdomSerializer.format_wisdom(wisdom)
    end

    private

    def wisdom_params
        params.require(:daily_wisdom).permit(:quote)
    end
    
end