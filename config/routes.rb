Rails.application.routes.draw do
  root 'sessions#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  
  resources :users do
  	resources :lists
  end

  resources :lists do
  	resources :items do
      member do 
        patch :complete
      end
    end
  end

end
