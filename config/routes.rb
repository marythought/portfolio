Rails.application.routes.draw do
  resources :blogs
  root 'welcome#index'
end
