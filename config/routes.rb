Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  match '404', to: "errors#not_found", via: :all, as: :not_found
  match '500', to: "errors#internal_server_error", via: :all, as: :server_error

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :feedbacks
  resources :questions
  resources :contexts
  get "givefeedback(/:handle(/:context))", to: 'feedbacks#new', as: :give_feedback
  get "feedbacks/new(/:handle(/:context))", to: 'feedbacks#new'
  get 'about', to: 'static#about'
  get "email-in/:correct", to: 'email_in#landing'
  get "email-in", to: 'email_in#landing'
  get 'users/fuzzysearch/:name', to: 'users#fuzzysearch'
  get '/dashboard(/:context)', to: 'users#dashboard', as: :dashboard
	get '/signup_opp', to: 'beta_users#new'
	post '/beta_users/create', to: 'beta_users#create'
  get '/world-statistics', to: 'world_data#statistics'

  namespace :users do
    resources :questions
  end

  # last before root
  get "(:handle(/:context))", to: 'static#home', as: :root_handle
  root 'static#home'
end

