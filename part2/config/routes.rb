Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root 'orders#new' 
  resources :orders
end
