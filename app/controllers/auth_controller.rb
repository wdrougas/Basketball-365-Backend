class AuthController < ApplicationController

def create 
    render json: User.find_by(username: params[:username])
end

end