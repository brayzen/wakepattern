Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'static#home'
	resources :feedbacks
	get 'givefeedback', to: 'feedbacks#give_feedback'
end
