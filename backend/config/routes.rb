Rails.application.routes.draw do
  get 'tasktable/index'
  root 'tops#show'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
    resources :users do
      resources :projects 
      resources :work_targets 
      resources :flags
      resources :tasks 
      resources :schedules do
      collection do
        get 'get_category_children', defaults: { format: 'json' }
        get 'get_category_grandchildren', defaults: { format: 'json' }
      end
      end
    end
end