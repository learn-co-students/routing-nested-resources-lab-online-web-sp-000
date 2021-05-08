Rails.application.routes.draw do
  resources :artists do
    resources :songs, only: [:show, :index]
  end
resources :songs, :artists, only: [:show, :index, :new, :create, :edit, :update]
end
