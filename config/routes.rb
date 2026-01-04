Rails.application.routes.draw do
  root "pages#home"

  get 'mission', to: 'pages#mission'
  get 'contenus', to: 'pages#contenus'
  get 'presse', to: 'pages#presse'
  get 'newsletter', to: 'pages#newsletter'

  # Nouvelles routes
  get 'podcast', to: 'pages#podcast'
  get 'blog', to: 'pages#blog'
  get 'equipe', to: 'pages#equipe'       # Remplace apropos
  get 'principes', to: 'pages#principes' # Nouvelle page philosophie
end
