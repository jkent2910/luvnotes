Rails.application.routes.draw do
  get 'welcome/index'

  get '/dashboard' => 'welcome#dashboard', as: 'dashboard'

  devise_for :users
  root 'welcome#index'

  resources :profiles

end
