class TeamsController < ApplicationController

    def index
        teams = Team.all
        render json: teams.to_json(serialized_data)
    end

    def show
        team = Team.find(params[:id])
        render json: team.to_json(serialized_data)
    end


    private


    def serialized_data
        {:except => [:created_at, :updated_at],
            :include => {
                :users => 
                {
                    :except => [:created_at, :updated_at]
                },
                :games => 
                {
                    :except => [:created_at, :updated_at]
                },
                :players => 
                {
                    :except => [:created_at, :updated_at]
                },
                :comments => 
                {
                    :except => [:created_at, :updated_at]
                }
            }
        }
    end

end
