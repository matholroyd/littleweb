class HomeController < ApplicationController
  def index
    if params[:text].present?
      Pusher['test_channel'].trigger('greet', {
        :greeting => params[:text]
      })
    end
  end
end