Rails.application.routes.draw do
  resources :artists do
    resources :songs, only: [:show, :index]
  end
  resources :songs
end

# Rails.application.routes.draw do
#
#   resources :authors, only: [:show] do
#     resources :posts, only: [:show, :index]
#   end
#
#   resources :posts, only: [:index, :show, :new, :create, :edit, :update]
#
#   root 'posts#index'
#
#   # get 'authors/:id/posts', to: 'authors#posts_index'      # Replaced by nesting Post resources within Author resources above
#   # get 'authors/:id/posts/:post_id', to: 'authors#post'
#
# end
