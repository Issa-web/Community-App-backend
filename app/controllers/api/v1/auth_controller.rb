
class Api::V1::AuthController < ApplicationController
    skip_before_action :logged_in?, only: [:create] #login
    def create
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            render json: {user: user, token: encode_token({user_id: user.id})}, status: :ok
        else
            render json: {error: "Invalid username or Password"}, status: :unauthorized
        end
    end
end
