Rails.application.routes.draw do
  devise_for :users
  root to: 'incomes#top'
  resources :incomes, only: [:index, :new, :edit, :update, :show]
  resources :fixed_costs, only: [:index, :new, :create, :edit, :update]
  resources :users, only: [:edit, :update]
end
