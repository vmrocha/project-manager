Rails.application.routes.draw do
  resources :projects do
    resources :tasks
  end

  get "up" => "rails/health#show", as: :rails_health_check

  root "projects#index"
end
