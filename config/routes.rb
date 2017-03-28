Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  # Maak alle routes aan, behalve die van show
  resources :portfolios, except: [:show]
  #voor show maak een aparte aan,namelijk portfolio/id ipv portfolios/id zoals het was
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  
  get 'pages/home'

  # get 'pages/about' is standaard rails
  # Je kunt als volgt dit aanpassen naar bijvoorbeeld /about
  get '/about-me', to: 'pages#about'
  # je gebruikt dus de mapping die je aan de rechtrkant van de rake routes ziet

  get '/contact', to: 'pages#contact'
  # door bovenstaande is de URI dus veranderd. Zie rake routes.
  # Er staat nu gewoon/about en /contact ip pages/contact en pages/about

  resources :blogs do
    member do
      get :toggle_status
    end
  end
  
  # De homepage voor de applicatie, hoeft geen home te heten
  root to: 'pages#home'
end
