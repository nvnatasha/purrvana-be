class Api:V1::UserCatsController < ApplicationController

    def index
        user_cats = UserCat.all
        render json: UserCatSerializer.format_user_cats(user_cats)
    end

    def show
        user_cat = UserCat.find(params[:id])
        render json: UserCatSerializer.format_user_cat(user_cat)
    end

    private

    def user_cat_params
        params.require(:user_cat).permit(:user, :cat)
    end
    
end