class Api::V1::PostsController < ApplicationController
    skip_before_action :logged_in?, only: [:create, :index, :show, :destroy]
    def index 
        @posts = Post.all 

        render json: @posts, :include => [:comments]
        
    end 

    def create 
        @post = Post.create(post_params)

        render json: @post
    end 

    def show
        @post = Post.find(params[:id])
        render json: @post.to_json(:methods => [:comments])
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post.update(taco_params)
        render json: @post.to_json
    end

    def destroy 
        @post = Post.find_by(id: params[:id])
        if @post
            @post.destroy
            render json: { messages: ["Comment was deleted!"] }, status: :ok
        else
            render json: { errors: ['Comment not found.'] }, status: :not_found
        end
    end 


    private 

    def post_params 
        params.require(:post).permit(:user_id, :description)
    end 
end

