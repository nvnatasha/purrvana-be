class Api::V1::CatsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    
    def index
        cats = Cat.all
        render json: CatSerializer.format_cats(cats)
    end

    def show
        cat = Cat.find(params[:id])
        render json: CatSerializer.format_cat(cat)
    end

    private

    def cat_params
        params.require(:cat).permit(:name, :mood, :purr_style, :img_url)
    end

    def record_not_found(error)
        render json: { error: error.message }, status: :not_found
    end

end