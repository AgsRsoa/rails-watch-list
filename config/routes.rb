Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :lists do
    resources :bookmarks, only: %i[new create]
  end
  resources :bookmarks, only: %i[destroy]
end

# voir toutes mes listes de films. (index)
# voir les détails d’une liste de films. (show)
# je peux créer une liste de films.(new, create)
# marquer (bookmark) un film dans une liste de films.(update)
# détruire un bookmark. (delete)
