Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "my_profile", to: "users#my_profile"

  resources :specialties, only: :index do
    resources :consultations, only: %i[create new]
  end

  resources :assessments, only: %i[new create show]

  resources :mentors, only: %i[show index]

  resources :technologies, only: :index

  resources :chat_channels, only: %i[show index new create] do
    resources :messages, only: %i[new create index]
  end
end
