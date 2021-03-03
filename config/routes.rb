Rails.application.routes.draw do
  mount Cased::Rails::Engine => '/cased'

  post '/login/:user_id' => 'sessions#create', as: :login
  post '/impersonate/:user_id' => 'sessions#impersonate', as: :impersonate
  delete '/logout' => 'sessions#destroy', as: :logout

  root to: 'users#index'
end
