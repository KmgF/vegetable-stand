Rails.application.routes.draw do
  devise_for :users
  root to:"tops#index"
  resources :stands do
    resources :vegetables
  end
  resources :users
end
