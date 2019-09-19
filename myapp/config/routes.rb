Rails.application.routes.draw do
  get '/cells' => 'cells#cells'
  get '/cell/:id'  => 'cells#cell'
  resources :beehives do
    resources :cells
  end
  root :to => "home#index"
end
