Rails.application.routes.draw do
  devise_for :users
  get 'messages/index'
  root to: "messages#index"
  #usersコントローラーだからsつくし編集に必要なのは:editと:update
  resources :users, only: [:edit, :update]
end
