Rails.application.routes.draw do
  root :to => 'patient#index'

  resources :patient, only: [:show, :index] do
    member do
      post '/access_request' => 'patient#access_request'
      get 'permit_access' => 'patient#permit_access'
      post 'permit' => 'patient#permit'
    end

    resources :prescription_medications, except: [:index]
  end

  devise_for :users
end
