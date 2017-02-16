Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/restaurants/:id/:user_id" => 'restaurants#show'  

  devise_scope :user do
    
    get '/login/:id', to: 'users/sessions#new'
    get '/loggedin/:id' => 'users/sessions#after_login'

    delete '/logout/:id', to: 'users/sessions#destroy'

    resources :restaurants do 

      resources :users

    end

  end

  

  delete '/queues/:id' => 'queues#destroy'

end
