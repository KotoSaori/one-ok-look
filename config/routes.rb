Rails.application.routes.draw do
  
  get 'sessions/new'
  
  get 'pages/index'
  
  # トップページは管理者ログイン画面
  root 'sessions#new'
  
  resources :users
  resources :positions
  resources :sections


  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  
  
end
