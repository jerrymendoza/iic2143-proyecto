Rails.application.routes.draw do
  devise_for :propietario_locals
  devise_for :admins
  devise_for :matchers
  resources :comunas
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'hello#index'
end
