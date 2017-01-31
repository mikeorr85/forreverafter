Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'pages#home'
  get 'photos', to: "pages#photos", as: "photos"
  get 'wedding-party', to: "pages#wedding_party", as: "wedding-party"
  get 'info', to: "pages#info", as: "info"
  get 'things-to-do', to: "pages#things_to_do", as: "things-to-do"
  get 'registry', to: "pages#registry", as: "registry"

  resources :rsvps, only: [:index, :create]
  resources :invites, only: [:show]

end
