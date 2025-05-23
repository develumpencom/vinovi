Rails.application.routes.draw do
  mount Users::Engine => "/"

  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  concern :watchable do
    resources :watched, shallow: true
  end

  resources :lists
  resources :movies, only: [ :show ], concerns: [ :watchable ]
  resources :people, only: [ :show ]
  resource :search, only: [ :show ], controller: :search
  resources :tv_series, only: [ :show ] do
    resources :tv_seasons, only: [ :show ]
  end
  resources :watched, only: [ :index ]

  root "search#show"
end
