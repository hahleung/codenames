Rails.application.routes.draw do
  namespace :codenames do
    resources :keys, only: [:create, :show]
  end
end
