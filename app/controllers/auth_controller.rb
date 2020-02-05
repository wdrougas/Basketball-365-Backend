class AuthController < ApplicationController

def create 
    user = User.find_by(username: params[:username])
    render json: user.to_json(serialized_data)
end

private

def serialized_data
    {:except => [:created_at, :updated_at],
            :include => {
                :team => 
                {
                    :except => [:created_at, :updated_at]
                },
                :comments => 
                {
                    :except => [:created_at, :updated_at]
                },
                :favorites => 
                {
                    :except => [:created_at, :updated_at]
                }
    
            }}
end

end