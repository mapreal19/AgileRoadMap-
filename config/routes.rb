AgileRoadMap::Application.routes.draw do

  #get "practicas/show"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  scope "(:locale)", :locale => /en|es/ do
    resources :sessions, only: [:create]
    root 'pages#home'
    get '/signup', to: 'users#new'
    post '/signup', to: 'users#create'
    get '/mi-agileroadmap', to: 'users#dashboard', as: 'dashboard'
    get '/signin', to: 'sessions#new'
    delete '/signout', to: 'sessions#destroy'

    # TODO SCOPE
    post '/user_practicas/sort', to: 'user_practicas#sort'
    post '/user_practicas/range', to: 'user_practicas#update_range'
    post '/user_practicas/comment' => 'user_practicas#update_comment'
    post '/user_practicas/aplicable' => 'user_practicas#update_aplicable'
    post '/user_practicas/update' => 'user_practicas#update'

    post '/user_objetivos/sort', to: 'user_objetivos#sort'
    post '/user_objetivos/interesa', to: 'user_objetivos#update_aplicable'
    post '/user_objetivos/update', to: 'user_objetivos#update'

    scope :controller => :pages, :path => 'agile-roadmap' do
      get '/', to: :agile_map_definition, as: 'agile_map_definition'
      get '/pasos-para-elaborar-un-agile-roadmap', to: :agile_map_pasos, as: 'agile_map_pasos'
      get '/que-es-agile-roadmap', to: :what_is_agile_map, as: 'what_is_agile_map'
      get '/equipo-agile-roadmap', to: :agile_team, as: 'agile_team'
      get '/stats', to: :stats
    end
    
    resources :practicas, only: [:index, :show], path: 'mapa-practicas-agiles'
    #get 'mapa-practicas-agiles/:id' => 'practicas#show', as: :practica

    resources :password_resets
    
    get 'user_countries', to: 'charts#user_countries'

  end


  # You can have the root of your site routed with "root"
  

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
