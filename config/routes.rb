Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  devise_scope :user do
    get "login",  to: "devise/sessions#new",     as: :new_user_session
    delete "logout", to: "devise/sessions#destroy", as: :destroy_user_session
  end

  authenticated :user do
    root to: "dashboard#index", as: :authenticated_root
  end

  root to: redirect("/login")

  get "up" => "rails/health#show", as: :rails_health_check
end
