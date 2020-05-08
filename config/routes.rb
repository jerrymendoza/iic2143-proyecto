Rails.application.routes.draw do
  devise_for :propietario_locals, path: 'locales', controllers: {
    sessions: 'locales/sessions',
    passwords: 'locales/passwords',
    registrations: 'locales/registrations'
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
  resources :comunas
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'hello#index'
end
