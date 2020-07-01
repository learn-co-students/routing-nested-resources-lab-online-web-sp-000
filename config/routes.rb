Rails.application.routes.draw do
  get 'artists/:id/songs', to: 'artists#index'
  get 'artists/:id/songs/:song_id', to: 'artists#show'

  resources :artists, only: [:index, :show]
  resources :songs
end
