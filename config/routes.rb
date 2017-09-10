Rails.application.routes.draw do
  root to: "forum/posts#index"

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  namespace :api do
    namespace :v1 do
      namespace :blog do
        resources :posts do
          resources :comments
        end
      end

      namespace :forum do
        resources :posts do
          resources :comments
        end
      end
    end
  end

  namespace :blog do
    resources :posts do
      resources :comments
    end
  end

  namespace :forum do
    resources :posts do
      resources :comments
    end
  end

  resources :users

  resources :posts do
    resources :comments
  end

end
