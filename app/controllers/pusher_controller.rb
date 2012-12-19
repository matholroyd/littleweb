class PusherController < ApplicationController
  def auth
    json = Pusher[params[:channel_name]].authenticate(params[:socket_id])
    render json: json
  end
end