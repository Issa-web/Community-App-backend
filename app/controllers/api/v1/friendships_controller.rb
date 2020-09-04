class Api::V1::FriendshipsController < ApplicationController
    skip_before_action :logged_in?, only: [:create, :index, :show, :destroy]
    def index
        @friendships = Friendship.all
        render json: @friendships
    end
    def create
        user = User.find_by(id: friendship_params[:user_id])
        friend = User.find_by(id: friendship_params[:friend_id])
        
        if user.friends.include?(friend)
            render json: {error: 'friendship already exists in the database'}, status: :not_acceptable
        else
           friendship = user.friendships.build(friend_id: friend.id)  
           friendship2 = friend.friendships.build(friend_id: user.id) 
           
           if friendship.save && friendship2.save
                render json: {message: 'friendship was successfully created'}, status: :created
           else 
                 render json: {error: 'friendship could not be saved'}, status: :not_acceptable
           end
        end

        def show
            @friendship = Friendship.find(params[:id])
            # render json: user.to_json
            render json: @friendship.to_json
        
          end
    end

    private
    def friendship_params
        params.require(:friendship).permit(:friend_id, :user_id)
    end
end
