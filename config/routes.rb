Rails.application.routes.draw do
  root "pages#home"

  get 'mission', to: 'pages#mission'
  get 'contenus', to: 'pages#contenus'
  get 'presse', to: 'pages#presse'

  # Nouvelles routes
  get 'podcast', to: 'pages#podcast'
  get 'blog', to: 'pages#blog'
  get 'equipe', to: 'pages#equipe'
  get 'principes', to: 'pages#principes'

  # Routes newsletters RESTful
  resources :newsletters, only: [:index, :show]
  # Ceci crée automatiquement :
  # GET /newsletters          -> newsletters#index
  # GET /newsletters/:id      -> newsletters#show
end
