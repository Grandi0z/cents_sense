Rails.application.routes.draw do
  get 'splash/home'
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root to: "users#show", as: :authenticated_root
    end

    unauthenticated do
      root to: "devise/sessions#home", as: :unauthenticated_root
    end
  end

  scope "/" do
    resources :users, only: :show do
      resources :expense_categories do
        resources :expenses
      end
    end
  end
end
