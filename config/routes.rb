Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :feedbacks
  get 'givefeedback', to: 'feedbacks#new'
	get 'about', to: 'static#about'
	get 'mission', to: 'static#mission'
  root 'static#home'
end

