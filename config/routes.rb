Rails.application.routes.draw do
  devise_for :users
  # 将来的には個別ページにrootするようにする（使用者はまず最初に自分のデータを見たいから）
  root to: 'incomes#top'
  resources :incomes, only: [:index, :show, :edit] do
    resources :fixed_costs, only: :index
  end
  resources :users, only: [:index, :show, :edit, :update]
end
