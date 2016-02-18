Rails.application.routes.draw do
  devise_for :users
  # resources :articles do
  #   resources :comments do
  #   end
  # end

  resources :projects
  root 'projects#index'
  get 'about', to: 'welcome#about'
  get 'resume', to: 'welcome#resume'
  get 'blog', to: 'welcome#blog'
end
