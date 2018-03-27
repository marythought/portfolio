Rails.application.routes.draw do
  devise_for :users

  resources :projects
  root 'projects#index'
  get 'about', to: 'welcome#about'
  get 'resume', to: 'welcome#resume'
  get 'blog', to: 'welcome#blog'
  get 'news', to: 'welcome#news'
end
