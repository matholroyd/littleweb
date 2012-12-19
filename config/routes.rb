LittleWeb::Application.routes.draw do
  root to: "home#index"
  
  match "/place", to: 'place#index'
  match "/place/:name", to: 'place#index'
  get "/place/:name/messages", to: 'messages#index'
  post "/place/:name/messages", to: 'messages#create'

  match "/pusher/auth", to: 'pusher#auth'
end
