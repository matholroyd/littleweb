LittleWeb::Application.routes.draw do
  root to: "home#index"

  match "/place/:name", to: 'place#index'
  match "/pusher/auth", to: 'pusher#auth'
end
