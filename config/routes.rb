AgileRoadMap::Application.routes.draw do
  scope "(:locale)", :locale => /en|es/ do
    resources :sessions, only: [:create]
    root 'pages#home'
    get '/signup', to: 'users#new'
    post '/signup', to: 'users#create'
    get '/mi-agileroadmap', to: 'users#dashboard', as: 'dashboard'
    get '/signin', to: 'sessions#new'
    delete '/signout', to: 'sessions#destroy'

    post '/user_practicas/sort', to: 'user_practicas#sort'
    post '/user_practicas/range', to: 'user_practicas#update_range'
    post '/user_practicas/comment' => 'user_practicas#update_comment'
    post '/user_practicas/aplicable' => 'user_practicas#update_aplicable'
    post '/user_practicas/update' => 'user_practicas#update'

    post '/user_objetivos/sort', to: 'user_objetivos#sort'
    post '/user_objetivos/interesa', to: 'user_objetivos#update_aplicable'
    post '/user_objetivos/update', to: 'user_objetivos#update'

    scope :controller => :pages, :path => 'agile-roadmap' do
      get '/', to: 'pages#agile_map_definition', as: 'agile_map_definition'
      get '/pasos-para-elaborar-un-agile-roadmap', to: 'pages#agile_map_pasos', as: 'agile_map_pasos'
      get '/que-es-agile-roadmap', to: 'pages#what_is_agile_map', as: 'what_is_agile_map'
      get '/equipo-agile-roadmap', to: 'pages#agile_team', as: 'agile_team'
      get '/stats', to: 'pages#stats'
    end

    resources :practicas, only: [:index, :show], path: 'mapa-practicas-agiles'
    resources :password_resets
  end
end
