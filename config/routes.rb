Rails.application.routes.draw do
  # namespace :admin do
  # get 'clients/index'
  # end

  # get 'home/index'

  # namespace :admin do
  # get 'workers/index'
  # end

  # resources :workers
  # namespace :admin do
  # get 'requests/index'
  # end

  namespace :admin do
    root 'requests#index'
    # get 'workers/index'

    get 'requests/:id/assign', to: 'requests#assign', as: :assign

    resources :clients 
    resources :workers 

    resources :requests do 
      member do 
        patch :resolve
        patch :unresolve
      end
      # resources :workers
    end
  end

  
  # devise_for :clients
  devise_for :clients, controllers: {registrations: "registrations"}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'home#index'
  # root 'requests#new'
   resources :requests do 
    member do
      patch :add
    end
  end

  get 'requests/:id/display_request', to: 'requests#display_request', as: :display_request
  get 'my_requests/', to: 'requests#my_requests', as: :my_requests
  # get 'move/', to: 'admin/workers#move', as: :move
  
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
