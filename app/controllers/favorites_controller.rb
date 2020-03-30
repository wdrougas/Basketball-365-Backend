class FavoritesController < ApplicationController

    def index
        favorites = Favorite.all
        render json: favorites.to_json(serialized_data)
    end

    def create
        favorite = Favorite.create(strong_params)
        if favorite.valid?
            render json: {message: "Player added to favorites!", favorite: favorite.to_json(serialized_data)}
        else
            render json: { message: "Player already added to favorites"}
        end
    end

    def show
        favorite = Favorite.find(params[:id])
        render json: favorite.to_json(serialized_data)
    end

    def destroy
        favorite = Favorite.find(params[:id])
        favorite.delete
        render json: favorite.to_json(serialized_data)
    end

    private

    def strong_params
        params.require(:favorite).permit(:user_id, :player_id)
    end

    def serialized_data
        {
            :include => {
                :user => 
                {
                    :except => [:created_at, :updated_at]
                },
                :player =>  
                {
                    :except => [:created_at, :updated_at]
                }
            }
        }
    end

end
