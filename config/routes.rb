Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'sports/kensaku' => 'sports#kensaku'
  resources :sports
  resources :sindans
  root 'topics#index'
end
