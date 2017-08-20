Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

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
    resources :posts
  end

  namespace :forum do
    resources :posts
  end

  root to: "forum/posts#index"

end
