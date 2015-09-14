Rails.application.routes.draw do
  devise_for :users
  resources :articles
  resources :projects
  root 'welcome#index'
  get 'welcome/work'
  get 'welcome/about'
  get 'portfolio', to: 'welcome#portfolio'
  get 'about', to: 'welcome#about'
end
