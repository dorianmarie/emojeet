Rails.application.routes.draw do
  namespace :api, defaults: { format: :json }, constraints: { format: :json } do
    resources :users do
      collection do
        get "current" => "users#current"
      end
    end

    resource :session
  end

  get "*path" => "pages#app"

  root to: "pages#app"
end
