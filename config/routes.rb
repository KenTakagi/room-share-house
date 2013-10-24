Hello::Application.routes.draw do
  resources :boards
  resources :rail_companies
  resources :lines
  resources :stations
  resources :rooms
  resources :houses

  get "sessions/create"
  get "sessions/destroy"

  get "/auth/:provider/callback" => "sessions#create"
  get "/signout" => "sessions#destroy"

  get "/stations/:line_id/fromline" => "stations#fromline"
  get "/lines/:company_id/fromcompany" => "lines#fromcompany"
  get "/users/edit" => "users#edit", :as => :user
  get "/users" => "users#show"
  get "/rents" => "rents#index"
  get "/rents/:id" => "rents#show"
  patch "/users/edit" => "users#update"#, :as => :user
  get "/rooms/:house_id/new"  => "rooms#new"
  get "/rooms/:house_id/index"  => "rooms#index"
  get "/inquiries/sendinquiry"  =>  "inquiries#sendinquiry"
  get "/inquiries/receiveinquiry"  =>  "inquiries#receiveinquiry"
  get "/inquiries/:to_userid/new"  =>  "inquiries#new"
  get "/inquiries/show/:id"  =>  "inquiries#show"
  get "/inquiries/receiveshow/:id"  =>  "inquiries#receiveshow"
  post "/inquiries"  =>  "inquiries#create"
  post "/inquiries/deleteInquiries"  =>  "inquiries#deleteInquiries"
  get "/boards/list/:kind"  => "boards#list"


  # ルートを設定していない場合はルートも設定
  root to: 'rents#index'

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
