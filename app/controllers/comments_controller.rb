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
        comment = Comment.find(params[:id])
        render json: comment.to_json(serialized_data)
    end

    def destroy
        comment = Comment.find(params[:id])
        comment.delete
        render json: comment.to_json(serialized_data)
    end

    private

    def strong_params
        params.require(:comment).permit(:user_id, :team_id, :body)
    end

    def serialized_data
        {
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

    def find_comment
        comment = Comment.find(params[:id])
    end
    
end
