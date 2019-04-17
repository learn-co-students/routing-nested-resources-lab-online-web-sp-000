Rails.application.routes.draw do
  resources :artists
  resources :songs

  resources :artists do
   # nested resource for artists
   resources :songs, only: [:show, :index]
 end
end
