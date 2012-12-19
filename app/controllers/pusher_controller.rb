class PusherController < ApplicationController
  def auth
    json = Pusher['private-channel'].authenticate(params[:socket_id])
    render json: json
  end
end