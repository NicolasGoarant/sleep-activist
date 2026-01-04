Rails.application.routes.draw do
  root "pages#home"
  
  get 'mission', to: 'pages#mission'
  get 'contenus', to: 'pages#contenus'
  get 'presse', to: 'pages#presse'
  get 'apropos', to: 'pages#apropos'
  get 'newsletter', to: 'pages#newsletter'
end
