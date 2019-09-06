Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  resources :projects
  root 'projects#index'
  get 'about', to: 'welcome#about'
  get 'resume', to: 'welcome#resume'
  get 'blog', to: 'welcome#blog'
  get 'news', to: 'welcome#news'
end
