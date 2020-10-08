Rails.application.routes.draw do
  # get 'artists/:id/songs', to: 'songs#artists_index'
  # get 'artists/:id/songs/:song_id', to: 'songs#artist'
  # resources :artists
  resources :artists do
    resources :songs, only: [:index, :show]
  end
  resources :songs

end
