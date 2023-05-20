Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "profiles", to: "pages#my_profile"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :specialties, only: :index do
    resources :consultations, only: %i[create new]
  end

  resources :assessments, only: %i[new create show]
  resources :mentors, only: %i[show index]
end
