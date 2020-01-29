class TeamGamesController < ApplicationController


    def create
        team_game = team_game.create(strong_params)
        if team_game.valid?
            render json: team_game.to_json(serialized_data)
        end
    end


    private

    def strong_params
        params.require(:team_game).permit(:game_id, :team_id,)
    end

end
