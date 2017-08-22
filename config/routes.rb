Rails.application.routes.draw do
  root 'application#index'

  post 'users' => 'users#create'
  get 'dashboard/:id' => 'users#show'


  get 'shoes' => 'shoes#index'
  post 'shoes' => 'shoes#create'
  delete 'shoes/:id' => 'shoes#destroy'
  post 'shoes/:id' => 'sales#create'
  

  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'


end
