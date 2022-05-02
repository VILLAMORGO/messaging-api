Rails.application.routes.draw do

  scope :api, defaults: { format: :json } do
    scope :v1 do
      devise_for :users, controllers: { sessions: :sessions }, path_names: { sign_in: :login }
      
      resource :user, only: [:index, :show, :update]

      resources :conversations do
        resources :messages
      end

      get '/users', to: 'users#index'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
