class Api::V1::MessagesController < ApplicationController
    skip_before_action :logged_in?, only: [:index, :show]
    def index
        @messages = Message.all
        render json: @messages
    end
    def show
        @message = Message.find(params[:id])
        render json: @message.to_json
    end
end
