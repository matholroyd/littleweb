LittleWeb::Application.routes.draw do
  root to: "home#index"
  
  match "/pusher/auth", to: 'pusher#auth'
end
