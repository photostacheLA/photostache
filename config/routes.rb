Rails.application.routes.draw do
  resources :admins, only: [:index, :edit, :show]
  devise_for :admins

  devise_scope :admin do
    authenticated :admin do
      root 'home#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
