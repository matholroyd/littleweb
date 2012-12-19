class PlaceController < ApplicationController
  def index
    @place = params[:name]
    @channel = "private-#{params[:name]}" 
  end
end