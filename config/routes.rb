Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :quizzes, only:[:index, :show]
  resources :questions, only:[:show]
end
