Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users, 
  controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }  

  namespace :api do
    namespace :v1, defaults: {format: 'json'} do
      resources :items, only: %i[index create destroy show]
      resources :category, only: %i[index create]
      resources :item_category, only: %i[index update create destroy]
      resources :cart, only: %i[index create destroy]
      resources :cart_list, only: %i[index create show]

    end
  end

  get '*path', to: 'api/v1/#error', defaults: { format: 'json' }

  root 'api/v1/api/#error', defaults: { format: 'json' }

end
