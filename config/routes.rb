Rails.application.routes.draw do
  resources :bands, only: [:index, :show, :create] do
    resources :albums, only: [:index, :show]
  end
end
