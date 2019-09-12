Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  root 'welcome#index'

  resources :projects
  get 'about', to: 'welcome#about'
  get 'resume', to: 'welcome#resume'
  get 'blog', to: 'welcome#blog'
  get 'news', to: 'welcome#news'

  # Forward all other requests to WelcomeController#index
  # Requests must be non-Ajax (!req.xhr?) and HTML Mime type (req.format.html?).
  get '*page', to: 'welcome#index', constraints: ->(req) do
    !req.xhr? && req.format.html?
  end

  namespace :v1, defaults: { format: 'json' } do
    get 'api', to: 'api#index'
  end
end
