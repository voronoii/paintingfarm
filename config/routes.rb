Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: 'users/registrations',
        omniauth_callbacks: "users/omniauth_callbacks" 
      }
  # resources :events
  root 'home#index'
  #문의메일
  
  post 'home/email_send'
  
  #이벤트
  get 'boards' => 'boards#index'
  post '/tinymce_assets' => 'tinymce_assets#create'
  # get 'boards/show/:id' => 'boards#show'
  # get 'boards/edit/:id' => 'boards#edit'
  # post 'boards/update/:id' => 'boards#update'
  # get 'boards/delete/:id' => 'boards#delete'
  # post 'boards/comment/:id' => 'boards#comment'
  get 'boards/create_notice' => 'boards#notice'
  post 'boards/create_notice' => 'boards#create_notice'
  get 'boards/edit_notice/:id' => 'boards#edit_notice'
  post 'boards/update_notice/:id' => 'boards#update_notice'
  get 'boards/delete_notice/:id' => 'boards#delete_notice'

  #마켓
  get 'markets' => 'markets#index'
  get 'markets/show/:id' => 'markets#show'
  post 'markets/email_send' => 'markets#email_send'
  get 'markets/new'
  post 'markets/create'
  get 'markets/edit/:id' => 'markets#edit'
  get 'markets/delete/:id' => 'markets#delete'
  post 'markets/update/:id' => 'markets#update'
  get 'markets/view_in_a_room/:id' => 'markets#view_in_a_room'

  
  #아티스트
  get 'artists' => 'artists#index'
  get 'artists/show/:id' => 'artists#show'
  
  get 'mypage/artist_profile'
  post 'mypage/artist_profile_create'
  
  #마이페이지
  get 'mypage' => 'mypage#index'
  get 'mypage/index' => 'mypage#index'
  post 'mypage/update/:id' => 'mypage#update'
  post 'mypage/create' => 'mypage#create'
  
  
  #검색결과
  get 'search_result' => 'search_result#index'
  get 'search_result/index' => 'search_result#index'



  #임시자게
  get 'imsi_boards' => 'boards#index_backup'
  post '/tinymce_assets' => 'tinymce_assets#create'
  get 'boards/notice' => 'boards#notice'
  post 'boards/notice' => 'boards#create_board_notice'
  get 'boards/new' => 'boards#new'
  post 'boards/new' => 'boards#new'
  post 'boards/create'
  get 'boards/show_notice/:id' => 'boards#show_notice'
  get 'boards/show/:id' => 'boards#show'
  get 'boards/edit/:id' => 'boards#edit'
  post 'boards/update/:id' => 'boards#update'
  get 'boards/delete/:id' => 'boards#delete'
  post 'boards/comment/:id' => 'boards#comment'
  
  
 






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
