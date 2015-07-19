Rails.application.routes.draw do


  resources :genres

  get 'signup' => 'users#new'

  resource :session
  resources :users

  root "movies#index"

  get 'movies/filter/:scope' => 'movies#index',as: 'filtered_movies'#, scope: 'hits'
  # get 'movies/filter/:scope' => 'movies#index'#, scope: 'flops'


  resources :movies do
    resources :reviews
    resources :favorites
  end

end
