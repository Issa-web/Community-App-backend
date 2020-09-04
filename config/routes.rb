Rails.application.routes.draw do
  # resources :friendships
  namespace :api do
    namespace :v1 do
      
    post '/login', to: "auth#create"
    resources :users
    resources :posts
    resources :comments
    resources :messages
    resources :chats
    resources :friendships
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
