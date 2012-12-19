class PlaceController < ApplicationController
  def index
    @place = URI.encode(params[:name].strip.downcase.gsub(/\s/, ''))

    if request.post?
      redirect_to "/place/#{@place}"
    else
      @channel = "private-#{params[:name]}" 
    end
  end
end