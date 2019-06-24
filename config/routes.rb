Rails.application.routes.draw do
  resources :artists, only: [:new, :create, :index, :edit, :update, :delete]
  resources :artists, only: [:show] do
    resources :songs, only: [:index, :show]
  end
  resources :songs
end
