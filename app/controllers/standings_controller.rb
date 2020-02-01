class StandingsController < ApplicationController

def index
    standings = Standing.all
    render json: standings.to_json(serialized_data)
end

def show
    standing = Standing.find(params[:id])
    render json: standing.to_json(serialized_data)
end

private

def serialized_data
    {:except => [:created_at, :updated_at]}
end


end
