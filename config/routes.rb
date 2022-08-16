Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users, 
              controllers: {
                  sessions: 'users/sessions',
                  registrations: 'users/registrations'
              }  

  namespace :api do
    namespace :v1, defaults: {format: 'json'} do
      resources :items, only: %i[index create destroy]
      resources :categories, only: %i[index create]
      resources :item_category, only: %i[index update create destroy show]
      resources :carts, only: %i[index update create destroy show]
      resources :cart_lists, only: %i[index update create destroy show]
      resources :users, only: %i[show]


    end
  end

  get '*path', to: 'api/v1/api#error', defaults: { format: 'json' }

  root 'api/v1/api#error', defaults: { format: 'json' }

end
