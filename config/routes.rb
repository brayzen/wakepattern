Rails.application.routes.draw do
  root 'static#home'
	resources :feedbacks
	get 'givefeedback', to: 'feedbacks#give_feedback'
end
