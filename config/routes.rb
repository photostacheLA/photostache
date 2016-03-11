Rails.application.routes.draw do
  devise_for :admins

  devise_scope :admin do
    authenticated :admin do
      root 'customers#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :admins, only: [:index, :edit, :show]
  resources :customers

  get '/gallery_addresses', to: 'application#gallery_web_address'

  root to: "customers#index"
end
