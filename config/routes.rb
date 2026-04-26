Rails.application.routes.draw do
  root "orders#index"

  resources :orders do
    member do
      post :ready
    end
  end
end
