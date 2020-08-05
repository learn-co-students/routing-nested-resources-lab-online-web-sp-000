Rails.application.routes.draw do
  resources :artists do
      resources :songs, only: [:index, :show]
    end
    resources :songs
  end

# nested resource routes to show all songs for an artist
# /artists/1/songs
# individual songs for that artist /artist/1/songs/1
# index and show actions only
# nested resource of artist, routes to a song as a nested recourse of an artist 
