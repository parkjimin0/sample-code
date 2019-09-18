Rails.application.routes.draw do
  resources :beehives
    resources :cells
  root :to => "home#index"
end
