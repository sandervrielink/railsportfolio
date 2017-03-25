Rails.application.routes.draw do
  resources :portfolios
  get 'pages/home'

  #get 'pages/about' is standaard rails
  #Je kunt als volgt dit aanpassen naar bijvoorbeeld /about
  get '/about-me', to: 'pages#about'
  # je gebruikt dus de mapping die je aan de rechtrkant van de rake routes ziet

  get '/contact', to: 'pages#contact'
  # door bovenstaande is de URI dus veranderd. Zie rake routes.
  # Er staat nu gewoon/about en /contact ip pages/contact en pages/about

  resources :blogs

  #De homepage voor de applicatie, hoeft geen home te heten
  root to: 'pages#home'
end
