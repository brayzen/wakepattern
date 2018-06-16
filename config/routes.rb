Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  match '404', to: "errors#not_found", via: :all, as: :not_found
  match '500', to: "errors#internal_server_error", via: :all, as: :server_error

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :feedbacks
  get "givefeedback/:handle", to: 'feedbacks#new'
  get "feedbacks/new/:handle", to: 'feedbacks#new'
  get 'about', to: 'static#about'
  get 'mailer', to: 'static#mail_it'
  get "email-in/:correct", to: 'email_in#landing'
  get "email-in", to: 'email_in#landing'
  get 'users/fuzzysearch/:name', to: 'users#fuzzysearch'
  get '/dashboard', to: 'users#dashboard'
  root 'static#home'
end

