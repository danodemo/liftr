Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root "users#welcome"

#POSTS CONTROLLER
  get "posts", to: "posts#index"
  get "posts/new", to: "posts#new", as: "post_new"
  post "posts", to: "posts#create"
  get "posts/:id", to: "posts#show", as: "post"
  delete "posts/:id", to: "posts#destroy"
  get "posts/:id/edit", to: "posts#edit", as: "edit"
  post "posts/:id", to: "posts#update"


#COMMENTS CONTROLLER
  get "posts/comments/new", to: "comments#new", as: "comment_new"
  post "posts/comments/:id", to: "comments#create"
  get "posts/commments/:id/edit", to: "comments#edit", as: "comment_edit"
  put "posts/comments/:id", to: "comments#update"
  delete "posts/comments/:id", to: "comments#destroy"
  get "posts/comments/:id", to: "comments#show", as: "comment"

#USERS CONTROLLER
  get "users/:id/posts", to: "users#myposts", as: "myposts"
  get "users/:id/comments", to: "users#mycomments", as: "mycomments"

#SESSION CONTROLLER
  get "login", to: "sessions#new", as: "login"
  post "login", to: "session#create"
  delete "login", to: "sessions#destroy"

#REGISTRATION CONTROLLER
  get "signup", to: "registrations#new", as: "signup"
  post "signup", to: "registrations#create"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
