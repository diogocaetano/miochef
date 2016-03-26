Rails.application.routes.draw do
<<<<<<< HEAD
  resources :chef_types
=======
  resources :daily_menus
>>>>>>> f03389a00d34bc695576859f84b907000a0bf85a
  # resources :nutritional_tables
  resources :addresses
  resources :chefs
  resources :plates do
    post :nutritional_table
    post :activate
    post :deactivate
    post :daily_menu
  end

  resources :plate_badges
  resources :plate_accompaniments
  resources :plate_types
  resources :ingredients
  resources :badges
  resources :countries

  resources  :users_admin, :controller => 'users'
  devise_for :users
  
  resources :roles_permissions
  resources :permissions
  resources :roles
  resources :entities
  resources :modules_categories

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: "dashboard#index"

  #api
  namespace :api do
    namespace :v1 do
      post 'login' => 'sessions#login'
    end
  end
  
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
