class UsersController < ApplicationController
    before_action :find_user, only: [:show, :destroy]

    def index
        users = User.all
        render json: users.to_json(serialized_data)
    end

    def create
        user = User.create(strong_params)
        if user.valid?
        render json: user.to_json(serialized_data)
        else
        render json: user.errors.messages
        end
    end

    def show
        user = User.find(params[:id])
        render json: user.to_json(serialized_data)
    end

    def destroy
        user = User.find(params[:id])
        user.delete
        render json: {message: "Profile deleted"}
    end

    private

    def strong_params
        params.require(:user).permit(:username, :password_digest, :email, :first_name, :last_name, :team_id)
    end

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
                  }
                }
    end

    def find_user
        user = User.find(params[:id])
    end

end

