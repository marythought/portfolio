Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  resources :articles do
    resources :comments do
    end
  end

  resources :projects
  root 'welcome#index'
  get 'welcome/work'
  get 'welcome/about'
  get 'portfolio', to: 'welcome#portfolio'
  get 'about', to: 'welcome#about'
end
