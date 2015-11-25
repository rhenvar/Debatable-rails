Rails.application.routes.draw do

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller

  root 'home#index'

  get 'home/news'
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  get '/join', to: 'debates#join'

  post '/login', to: 'sessions#create'

  resources :users do
    get :validate_email
    resources :debates
  end
end
