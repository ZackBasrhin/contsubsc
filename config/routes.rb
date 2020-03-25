Rails.application.routes.draw do
  devise_for :users
  root to: 'incomes#top'
  resources :incomes, only: [:index, :new, :edit, :update, :show] do
    resources :fixed_costs, only: [:index, :new, :edit, :update]
  end
  resources :users, only: [:index, :show, :edit, :update]
end
