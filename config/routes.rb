Tefeci::Application.routes.draw do
  
  match "/auth/:provider/callback" => "authenticate#login"
  
  match "/logout" => "authenticate#logout"
  
  # get '/auth/:provider/callback', to: 'authenticate#login'
  resources :debts

  resources :victims

  root :to => 'home#index'

end
