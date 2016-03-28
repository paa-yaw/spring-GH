Rails.application.routes.draw do
  get 'errors/not_found'

  get 'errors/internal_server_error'

  # namespace :admin do
  # get 'home/home'
  # end

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
    
    root 'home#index'
     
    # routes to assign and unassign a worker  
    get 'requests/:id/assign', to: 'requests#assign', as: :assign
    delete 'workers/:id/unassign', to: 'workers#unassign', as: :unassign


    
    # get 'clients/:id/client_requestss', to: 'clients#client_requestss', as: :client_requestss
    get 'clients/admin_registration', to: 'clients#admin_registration', as: :registration
    get '/admin_list', to: 'clients#admin_list', as: :list


    # routes to client_requests in admin request controller
    get '/clients/:client_id/requests/client_requests', to: 'requests#client_requests', as: :client_requests
    post 'clients/:client_id/requests/client_requests', to: 'requests#create'



    # routes to create and update admin
    post '/clients/admin_list', to: 'clients#create_admin', as: :create_admin
    get 'clients/:id/edit_admin', to: 'clients#edit_admin', as: :edit_admin
    # post 'clients/:id', to: 'clients#admin_list'
    patch 'clients/:id', to: 'clients#update_admin', as: :update_admin



    # routes to create and update client
    get 'clients/:id/edit', to: 'clients#edit', as: :edit_client
    patch 'clients/:id/index', to: 'clients#update', as: :update_client

    # post '/clients/:id/requests/:id/client_requests', to: 'clients#client_requests', as: :clients_requests
    

    resources :clients, except: [:edit, :update] do
      resources :requests
    end

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
   resources :requests, except: [:index] do 
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

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all
end
