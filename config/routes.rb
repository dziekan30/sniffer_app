Rails.application.routes.draw do
  namespace :api do
    get "/users" => 'users#index'
    post "/users" => "users#create"
    get '/users/:id' => 'users#show'
    
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

    get  '/requests' => 'requests#index'
    post '/requests' => 'requests#create'
    get '/requests/:id' => 'requests#show'
    patch '/requests/:id' => 'requests#update'
    delete '/requests/:id' => 'requests#destroy'

    get  '/breeds' => 'breeds#index'
    post '/breeds' => 'breeds#create'
    get '/breeds/:id' => 'breeds#show'
    patch '/breeds/:id' => 'breeds#update'
    delete '/breeds/:id' => 'breeds#destroy'

    get  '/makeups' => 'makeups#index'
    post '/makeups' => 'makeups#create'
    get '/makeups/:id' => 'makeups#show'
    patch '/makeups/:id' => 'makeups#update'
    delete '/makeups/:id' => 'makeups#destroy'
    
    
  end
end
