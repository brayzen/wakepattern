Rails.application.routes.draw do
  match '404', to: "errors#not_found", via: :all, as: :not_found
  match '500', to: "errors#internal_server_error", via: :all, as: :server_error

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :feedbacks
  get "givefeedback/:handle", to: 'feedbacks#new'
  get 'about', to: 'static#about'
  get 'mission', to: 'static#mission'
  get 'mailer', to: 'static#mail_it'
  get 'users/fuzzysearch/:name', to: 'users#fuzzysearch'
  root 'static#home'

end

