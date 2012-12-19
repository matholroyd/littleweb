class PlaceController < ApplicationController
  def index
    @place = params[:name]

    if request.post?
      redirect_to "/place/#{@place}"
    else
      @channel = "private-#{params[:name]}" 
    end
  end
end