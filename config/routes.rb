Rails.application.routes.draw do
  resources :artists
  resources :songs

  resources :artists, only: [:show] do
    #nested resources for songs
    resources :songs, only: [:show, :index]
  end

end
