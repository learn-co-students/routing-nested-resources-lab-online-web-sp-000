Rails.application.routes.draw do
  resources :artists  do
    resources :songs, only: [:show, :index]
  end

  resources :artists, only: [:show, :index]
  resources :songs, only: [:show, :index, :new, :create, :edit, :update]
end
