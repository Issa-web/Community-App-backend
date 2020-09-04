class Api::V1::CommentsController < ApplicationController
    skip_before_action :logged_in?, only: [:create, :index]
    def index 
        @comments = Comment.all 

        render json: @comments
    end 

    def create 
        @comment = Comment.create(comment_params)
        
        render json: @comment, status: :created
    end 

    private

    def comment_params
        params.require(:comment).permit(:user_id, :post_id, :content)
    end

end
