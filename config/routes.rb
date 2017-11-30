Rails.application.routes.draw do

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :quizzes, param: :quizz_slug, only:[:index, :show]
  resources :questions, only:[:show, :update]
  resources :quiz_sessions, only: [:new, :create]
end
