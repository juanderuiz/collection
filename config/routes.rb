Rails.application.routes.draw do
  resources :bands, only: :index do
    resources :albums, only: [:index, :show]
  end
end
