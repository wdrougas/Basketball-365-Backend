class PlayersController < ApplicationController

    def index
        players = Player.all
        render json: players.to_json(serialized_data)
    end


    def show
        player = Player.find(params[:id])
        render json: player.to_json(serialized_data)
    end

    

    private


    def serialized_data
        {:except => [:created_at, :updated_at],
                :include => {
                    :team =>
                    {
                        :except => [:created_at, :updated_at]
                    }
                }}
    end

    

end
