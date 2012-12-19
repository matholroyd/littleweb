class HomeController < ApplicationController
  def index
    @place = session[:place]
  end
end