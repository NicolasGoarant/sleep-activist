Rails.application.routes.draw do
  root "pages#home"

  get 'mission', to: 'pages#mission'
  get 'contenus', to: 'pages#contenus'
  get 'presse', to: 'pages#presse'

  # Nouvelles routes
  get 'podcast', to: 'pages#podcast'
  get 'equipe', to: 'pages#equipe'
  get 'principes', to: 'pages#principes'

  # Routes newsletters RESTful
  resources :newsletters, only: [:index, :show]

  # Blog - Routes dynamiques avec articles de la BDD
  get 'blog', to: 'articles#index', as: :blog
  get 'blog/:slug', to: 'articles#show', as: :article

    # Newsletter subscribers - AJOUTER CES LIGNES ICI
  resources :subscribers, only: [:new, :create] do
    collection do
      get :thank_you
    end
  end

  get 'communaute', to: 'pages#communaute'

  # Admin
  namespace :admin do
    resources :articles do
      member do
        post :publish
        post :unpublish
      end
    end
  end

end
