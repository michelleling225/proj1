Rails.application.routes.draw do
  devise_for :trainers
  root to: "home#index"
  resources :trainers
  patch '/capture', to: 'pokemons#capture'
  patch '/damage', to: 'pokemons#damage'
  post '/pokemons', to: 'pokemons#create', as: :pokemon 
  get '/pokemons/new', to: 'pokemons#new'
  get '/pokemons', to: 'pokemons#create'
end
