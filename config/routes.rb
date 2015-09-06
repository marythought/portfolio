Rails.application.routes.draw do
  resources :blogs
  root 'welcome#index'
  get 'welcome/work'
  get 'welcome/about'
  get 'portfolio', to: 'welcome#portfolio'
  get 'about', to: 'welcome#about'
end
