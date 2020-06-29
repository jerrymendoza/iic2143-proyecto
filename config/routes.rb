Rails.application.routes.draw do
  resources :categories
  resources :likes
  post 'likes', to: 'likes#create'
  get 'gustos/new', to: 'gustos#new'
  post 'gustos', to: 'gustos#create'
  get 'gustos', to: 'gustos#index'
  get 'gustos/:id', to: 'gustos#show', as: 'gusto'
  get 'gustos/:id/edit', to: 'gustos#edit', as: 'gustos_edit'
  patch 'gustos/:id', to: 'gustos#update'
  delete 'gustos/:id', to: 'gustos#destroy'
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
  resources :matcher_steps
  
  match '/admins', to: 'admins#index', via: 'get'
  match '/matchers', to: 'matchers#index', via: 'get'
  get 'matchers/:id', to: 'matchers#show', as: 'matcher'
  get 'matchs/:id', to: 'matches#show', as: 'matches'
  get '/spotify_request', to: 'matchers#spotify_request', as: 'spotify_request'
  get '/spotify_callback', to: 'matchers#spotify_callback', as: 'spotify_callback'
  resources :comunas
  get 'locals/solicitudes', to: 'locals#index_no_aceptados'
  get 'locals/mis_locales', to: 'locals#index_locals_de_propietario_local'
  patch 'locals/solicitudes', to: 'locals#enviar_aceptar_local'
  resources :locals do
    resources :comentarios, only: %i[create show update destroy]
  end
  resources :matches do
    resources :meetings, only: %i[create]
  end
  get 'mis-matches', to: 'matches#index'
  resources :meetings, only: %i[edit update show index destroy]
  patch '/meetings', to: 'meetings#enviar_aceptar_por_matcher'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'hello#index'
end
