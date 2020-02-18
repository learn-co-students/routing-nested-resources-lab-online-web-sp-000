# Rails.application.routes.draw do
#   resources :artists
#   resources :songs
# end

Rails.application.routes.draw do
 
  resources :artists, only: [:show] do
    # nested resource for posts
    resources :songs, only: [:show, :index]
  end
  
  resources :artists, only: [:index]
  resources :songs, only: [:index, :show, :new, :create, :edit, :update]
 
  root 'songs#index'
end
