Rails.application.routes.draw do
  root 'tops#show'
  get '/signup', to: 'users#new'
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
  ##end      
  resource :session,only: [:create,:destroy]
end