Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :feedbacks
  get "givefeedback/:handle", to: 'feedbacks#new'
	get 'about', to: 'static#about'
	get 'mission', to: 'static#mission'
	get 'mailer', to: 'static#mail_it'
  get 'users/fuzzysearch/:name', to: 'users#fuzzysearch'
  root 'static#home'
end

