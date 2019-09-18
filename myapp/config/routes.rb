Rails.application.routes.draw do
  resources :beehives do
    resources :cells
  end
  root :to => "home#index"
end
