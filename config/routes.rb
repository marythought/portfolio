Rails.application.routes.draw do
  devise_for :users
  # resources :articles do
  #   resources :comments do
  #   end
  # end

  resources :projects
  root 'welcome#index'
  get 'about', to: 'welcome#about'
end
