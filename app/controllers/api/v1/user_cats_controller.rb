class Api::V1::UserCatsController < ApplicationController

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
  favorite = UserCat.most_used_for(user)

  if favorite
    render json: {
      data: {
        id: favorite.id.to_s,
        type: 'user_cat',
        attributes: {
          cat: {
            name: favorite.cat.name,
            mood: favorite.cat.mood,
            img_url: favorite.cat.img_url
          },
          times_used: favorite.times_used
        }
      }
    }
  else
    render json: { message: "No favorite cat yet." }, status: :ok
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