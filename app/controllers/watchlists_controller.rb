class WatchlistsController < ApplicationController

    def index
        watchlists = Watchlist.all
        render json: watchlists.to_json(serialized_data)
    end

    def create
        watchlist = Watchlist.create(strong_params)
        if watchlist.valid?
            render json: {message: "Game added to Watchlist!", watchlist: watchlist.to_json(serialized_data)}
        else
            render json: { message: "Game already added to watchlist"}
        end
    end

    def show
        watchlist = Watchlist.find(params[:id])
        render json: watchlist.to_json(serialized_data)
    end

    def destroy
        watchlist = Watchlist.find(params[:id])
        watchlist.delete
        render json: watchlist.to_json(serialized_data)
    end

    private

    def strong_params
        params.require(:watchlist).permit(:user_id, :game_id)
    end

    def serialized_data
        {
            :include => {
                :user => 
                {
                    :except => [:created_at, :updated_at]
                },
                :game => 
                {
                    :except => [:created_at, :updated_at]
                }
            }
        }
    end

end