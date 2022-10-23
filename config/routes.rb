Rails.application.routes.draw do
  root "writings#index"

  resources :writings
end
