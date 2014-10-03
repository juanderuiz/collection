Rails.application.routes.draw do
  resources :bands, only: [:index, :show, :create, :destroy] do
    resources :albums, only: [:index, :show, :create, :destroy]
  end
end
