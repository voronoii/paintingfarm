Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: 'users/registrations',
        omniauth_callbacks: "users/omniauth_callbacks" 
      }
  # resources :events
  root 'home#index'
  
  #이벤트
  get 'boards' => 'boards#index'
  # post '/tinymce_assets' => 'tinymce_assets#create'
  # get 'boards/show/:id' => 'boards#show'
  # get 'boards/edit/:id' => 'boards#edit'
  # post 'boards/update/:id' => 'boards#update'
  # get 'boards/delete/:id' => 'boards#delete'
  # post 'boards/comment/:id' => 'boards#comment'
  # post 'boards/create_notice' => 'boards#create_notice'
  # get 'boards/notice' => 'boards#notice'

  #마켓
  get 'markets' => 'markets#index'
  get 'markets/show/:id' => 'markets#show'
  post 'markets/email_send' => 'markets#email_send'
  get 'markets/new'
  post 'markets/create'
  # get 'markets/edit/:id' => 'markets#edit'
  # get 'markets/delete/:id' => 'markets#delete'
  # post 'markets/update/:id' => 'markets#update'
  get 'markets/view_in_a_room/:id' => 'markets#view_in_a_room'
  
  
  #아티스트
  get 'artists' => 'artists#index'
  get 'artists/show/:id' => 'artists#show'

  
  # get ':controller(/:action(/:id))'
  # post ':controller(/:action(/:id))'
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
