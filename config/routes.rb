Rails.application.routes.draw do
  
  root 'homes#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'login' => 'users#login'
  post '/signup' => 'users#create'
  
  get 'users/show'
  put 'users/update'
end
