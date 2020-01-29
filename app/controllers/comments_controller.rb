class CommentsController < ApplicationController
    before_action :find_comment, only: [:show, :destroy]

    def index
        comments = Comment.all
        render json: comments.to_json(serialized_data)
    end

    def create
        comment = Comment.create(strong_params)
        if comment.valid?
            render json: comment.to_json(serialized_data)
        end
    end

    def show
        render json: comment.to_json(serialized_data)
    end

    def destroy
        comment.delete
        render json: {message: "Comment deleted"}
    end

    private

    def strong_params
        params.require(:comment).permit(:user_id, :team_id, :body)
    end

    def serialized_data
        {:except => [:created_at, :updated_at],
            :include => {
                :user => 
                {
                    :except => [:created_at, :updated_at]
                },
                :team => 
                {
                    :except => [:created_at, :updated_at]
                }
            }
        }
    end

    def find_user
        comment = Comment.find(params[:id])
    end
    
end
