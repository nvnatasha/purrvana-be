class Api::V1::CatsController < ApplicationController

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

end