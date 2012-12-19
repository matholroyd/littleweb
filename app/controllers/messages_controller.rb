class MessagesController < ApplicationController
  def index
    render json: store.get_messages.to_json
  end
  
  def create
    message = params[:message][:text]
    store.add_message(message)
    
    render json: "OK"
  end
  
  private 
  
  def store
    @store ||= MessageStore.new(params[:name])
  end
end