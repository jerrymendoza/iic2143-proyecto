Rails.application.routes.draw do

  get 'matchers/index'
  get 'admins/index'
  get 'gustos/new', to: 'gustos#new'
  post 'gustos', to: 'gustos#create'
  get 'gustos', to: 'gustos#index'
  get 'gustos/:id', to: 'gustos#show', as:'gusto'
  get 'gustos/:id/edit', to: 'gustos#edit', as:'gustos_edit'
  patch 'gustos/:id', to: "gustos#update"
  delete 'gustos/:id', to: "gustos#destroy"

  devise_for :propietario_locals, path: 'locales', controllers: {
    sessions: 'propietario_locals/sessions',
    passwords: 'propietario_locals/passwords',
    registrations: 'propietario_locals/registrations'
}
  devise_for :admins, path: 'admins', controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
}
  devise_for :matchers, path: 'matchers', controllers: {
    sessions: 'matchers/sessions',
    passwords: 'matchers/passwords',
    registrations: 'matchers/registrations'
}
  match '/admins',   to: 'admins#index',   via: 'get'
  match '/matchers',   to: 'matchers#index',   via: 'get'
  resources :comunas
  resources :locals
  resources :meetings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'hello#index'
end
