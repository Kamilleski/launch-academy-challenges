Rails.application.routes.draw do
  root "campsites#index"

  resources :campers, only: [:index] do
    resources :supplies, only: [:index]
  end
  resources :campsites, only: [:index] do
    resources :campers, only: [:index]
  end
  resources :supplies, only: [:index]
  resources :campers, only: [:index]
end
