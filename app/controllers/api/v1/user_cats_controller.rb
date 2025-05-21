class Api:V1::UserCatsController < ApplicationController

    def index
        user_cats = UserCat.all
        render json: UserCatSerializer.format_user_cats(user_cats)
    end

    def show
        user_cat = UserCat.find(params[:id])
        render json: UserCatSerializer.format_user_cat(user_cat)
    end

    def most_used
        user = User.find(params[:user_id])
        most_used_user_cat = user.user_cats
                                .includes(:cat)
                                .order(times_used: :desc)
                                .first
    
        if most_used_user_cat
            render json: {
                cat_name: most_used_user_cat.cat.name,
                times_used: most_used_user_cat.times_used,
                user_cat_id: most_used_user_cat.id
            } 
        else
            render json: { error: "No cats found for this user" }, status: :not_found
        end
    end

    def increment_user_cat_usage(user, cat)
        user_cat = UserCat.find_by(user: user, cat: cat)
        user_cat.increment!(:times_used) if user_cat
    end

    private

    def user_cat_params
        params.require(:user_cat).permit(:user, :cat)
    end

end