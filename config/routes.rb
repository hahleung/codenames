Rails.application.routes.draw do
  namespace :codenames do
    resources :welcome, only: [:index]

    resources :keys, only: [:create, :show]

    resources :retrieve_key, only: [:create]
  end
end
