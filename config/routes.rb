Rails.application.routes.draw do
  resources :blogs
  root 'welcome#index'
  get 'welcome/work'
  get 'welcome/about'
end
