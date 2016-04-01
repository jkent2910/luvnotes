Rails.application.routes.draw do
  get 'welcome/index'

  get '/dashboard' => 'welcome#dashboard', as: 'dashboard'

  get '/admin' => 'welcome#admin', as: 'admin'

  get '/invite', to: 'welcome#send_invite', :as => 'invite'
  match '/send_invite', to: 'welcome#send_invite_email', via: 'post'

  get '/send_confirm', to: 'welcome#send_confirm_email', via: 'post', as: 'send_confirm'

  devise_for :users, :controllers => {:registrations => "registrations", :sessions => "sessions"}
  root 'welcome#index'

  resources :profiles
  resources :prompts do
    resources :prompt_responses
  end

end
