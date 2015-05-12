Rails.application.routes.draw do
  
  devise_scope :user do
    get '/api/current_user' => 'users/sessions#show_current_user', as: 'show_curren\
t_user'
    post '/api/check/is_user' => 'users/users#is_user', as: 'is_user'
  end
 
  devise_for :users,
        :controllers => {
          :omniauth_callbacks => "users/omniauth_callbacks"
        }

  get '/dashboard' => 'welcome#dashboard'
  root to: 'welcome#index'

  namespace :api, defaults: {format: :json} do
  	namespace :v1 do
  	  resources :vinilos, only: [:index]
      resources :bands, only: [:index, :show, :create, :destroy] do
        resources :albums, only: [:index, :show, :create, :update, :destroy]
      end
    end
  end
end
