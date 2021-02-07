Rails.application.routes.draw do
  
  # HTTPリクエスト URL, to: 'コントローラ名#アクション名'
  # HTTPリクエスト URL, to: 'コントローラ名#アクション名' as: 'ルート名'
  
  # トップページは管理者ログイン画面
  root 'sessions#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users
  resources :positions
  resources :sections
  resources :company_holidays
  
  # <---ここから---as: 'Prefix'は重複ダメ--->
  # post   '/login',   to: 'sessions#create'
  # delete '/logout',  to: 'sessions#destroy'
  
  # get '/users/new', to: 'users#new', as: 'new_users'
  # post '/users/new', to: 'users#create', as: 'new_users'
  # patch '/users/new', to: 'users#update', as: 'new_users'
  # delete '/users/new', to: 'users#destroy', as: 'new_users'
  
  # get '/positions/new', to: 'positions#new', as: 'new_positions'
  # post '/positions/new', to: 'positions#create', as: 'new_positions'
  # patch '/positions/new', to: 'positions#update', as: 'new_positions'
  # delete '/positions/new', to: 'positions#destroy', as: 'new_positions'
  
  # get '/sections/new', to: 'sections#new', as: 'new_sections'
  # post '/sections/new', to: 'sections#create', as: 'new_sections'
  # patch '/sections/new', to: 'sections#update', as: 'new_sections'
  # delete '/sections/new', to: 'sections#destroy', as: 'new_sections'
  # <---ここまで---as: 'Prefix'は重複ダメ--->
  
end
