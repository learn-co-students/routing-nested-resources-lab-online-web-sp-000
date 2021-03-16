Rails.application.routes.draw do
  resources :artists, only: [:new, :create, :destroy, :edit, :index, :show, :update] do
    resources :songs, only: [:index, :show]
  end
  resources :songs
end
