Rails.application.routes.draw do
 
  root "application#index"
  namespace :api, defaults: {format: :json} do
  	namespace :v1 do
  	  resources :vinilos, only: [:index]
      resources :bands, only: [:index, :show, :create, :destroy] do
        resources :albums, only: [:index, :show, :create, :update, :destroy]
      end
    end
  end
end
