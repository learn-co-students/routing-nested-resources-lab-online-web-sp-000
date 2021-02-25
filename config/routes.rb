Rails.application.routes.draw do

  resources :artists, only: [:show, :index, :new, :create, :edit, :update, :destroy] do 
    resources :songs, only: [:show, :index]
  end 

  resources :songs
end
