Rails.application.routes.draw do
  get 'gustos/new', to: 'gustos#new'
  post 'gustos', to: 'gustos#create'
  get 'gustos', to: 'gustos#index'
  get 'gustos/:id', to: 'gustos#show', as:'gusto'
  get 'gustos/:id/edit', to: 'gustos#edit', as:'gustos_edit'
  patch 'gustos/:id', to: "gustos#update"
  delete 'gustos/:id', to: "gustos#destroy"
  resources :comunas
  resources :locals
  resources :meetings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'hello#index'
end
