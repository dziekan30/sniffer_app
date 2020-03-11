Rails.application.routes.draw do
  namespace :api do

    post "/users" => "users#create"
    post "/sessions" => "sessions#create"

    get 'dogs' => 'dogs#index'
    post 'dogs' => 'dogs#create'
    get 'dogs/:id' => 'dogs#show'
    patch 'dogs/:id' => 'dogs#update'
    delete 'dogs/:id' => 'dogs#destroy'

    get '/images' => 'images#index'
    post '/images' => 'images#create'
    get '/images/:id' => 'images#show'
    patch '/images/:id' => 'images#update'
    delete '/images/:id' => 'images#destroy'
    
  end
end
