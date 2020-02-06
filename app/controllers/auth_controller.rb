class AuthController < ApplicationController

def create 
    user = User.find_by(username: params[:username])
    if !user.nil?
    render json: user.to_json(serialized_data)
    else
    render json: {error: "Invalid username. Please try again!"} 
    end 
end

private

def serialized_data
    {:except => [:created_at, :updated_at],
            :include => {
                :team => 
                {
                    :except => [:created_at, :updated_at],
                        :include => {
                            :home_games => 
                            {
                                :except => [:created_at, :updated_at]
                            },
                            :visiting_games => 
                            {
                                :except => [:created_at, :updated_at]
                            }
                        }
                },
                :comments => 
                {
                    :except => [:created_at, :updated_at]
                },
                :favorites => 
                {
                    :except => [:created_at, :updated_at]
                },
                :players =>
                {
                    :except => [:created_at, :updated_at]
                }
    
            }}
    end

end