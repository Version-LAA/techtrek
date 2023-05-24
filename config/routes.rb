Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "my_profile", to: "users#my_profile"
  get "javascript", to: "specialties#javascript"
  get "cyber_security", to: "specialties#cyber_security"
  get "python", to: "specialties#python"
  get "resume_review", to: "specialties#resume_review"
  get "salary_review", to: "specialties#salary_review"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :specialties, only: :index do
    resources :consultations, only: %i[create new]
  end

  resources :assessments, only: %i[new create show]
  resources :mentors, only: %i[show index]
end
