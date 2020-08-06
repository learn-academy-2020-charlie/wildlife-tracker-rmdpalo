Rails.application.routes.draw do
  resources :sightings
  get '/sightings/:start_date/:end_date' => 'sightings#report'
  resources :animals
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
