Rails.application.routes.draw do
  
  

  get 'home/index'

  get 'home/show'

  devise_for :users,path_names: { sign_in: "login", sign_out: "logout"},
    controllers: { omniauth_callbacks: "omniauth_callbacks" }
  

  resources :posts do

   resources :comments
 end  
 
 resources :posts

  root to: 'home#index'
end
  
 