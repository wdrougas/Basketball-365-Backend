class UsersController < ApplicationController
    before_action :find_user, only: [:show, :destroy]

    def index
        users = User.all
        render json: users.to_json(serialized_data)
    end

    def create
        user = User.create(strong_params)
        if comment.valid?
            render json: comment.to_json(serialized_data)
        end
    end

    def show
        render json: user.to_json(serialized_data)
    end

    def destroy
        user.delete
        render json: {message: "Comment deleted"}
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
                    }
                }}
    end

    def find_user
        user = User.find(params[:id])
    end

end