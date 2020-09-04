class Api::V1::UsersController < ApplicationController

skip_before_action :logged_in?, only: [:create, :index, :show] #sign
  def index
    users = User.all
    render json: users, :include => [:posts, :comments]
  end

  def create
    user = User.new(user_params)
        if user.valid?
            user.save
            render json: {user: user, token: encode_token({user_id: user.id})}
        else
            render json: {error: "Failed to create the user"}
        end
  end

  def show

    user = User.find(params[:id])
    # render json: user.to_json
    render json: user.to_json(:methods => [:posts, :comments, :friends])

  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end


#New users sign up form 
# fetch('http://localhost:3000/api/v1/users', configObj("POST", true, {"user": {"username": "Issa", "password": "password1", "image": "none"}}))
#     .then((response) => response.json())
#     .then((data) => console.log(data))
#     .catch((error) => alert(error));


#this is helper method, it takes 3 arguments
#let configObj = (method, authenticate, data) => {
  #  const cfg = { method, headers:
    #{
   #   "Content-Type": 'application/json',
    #  "accept": 'application/json'
   # }};
   # data && (cfg.body = JSON.stringify(data))
    #authenticate && (cfg.headers.Authorization = `Bearer ${localStorage.token}`)
   # return cfg;
  #}

# export default configObj;