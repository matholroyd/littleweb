class PlaceController < ApplicationController
  def index
    @place_name = "private-#{params[:name]}" 
  end
end