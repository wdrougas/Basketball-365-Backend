class GamesController < ApplicationController


    def index
        games = Game.all
        render json: games.to_json(serialized_data)
    end

    def show
        game = Game.find(params[:id])
        render json: game.to_json(serialized_data)
    end


    private


    def serialized_data
        {:except => [:created_at, :updated_at],
            :include => {
                :teams => 
                {
                    :except => [:created_at, :updated_at]
                }
            }}
    end




end
