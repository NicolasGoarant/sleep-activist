#!/bin/bash

echo "🚀 Installation du système de blog Sleep Activists..."

# 1. Générer le modèle
echo "📝 Génération du modèle Article..."
rails generate model Article title:string slug:string excerpt:text content:text emoji:string category:string reading_time:integer cover_image_url:string cover_gradient:string published:boolean published_at:datetime author:string views_count:integer

# 2. Créer les dossiers
echo "📁 Création des dossiers..."
mkdir -p app/controllers/admin
mkdir -p app/views/articles
mkdir -p app/views/admin/articles
mkdir -p db/seeds

# 3. Télécharger et copier tous les fichiers
echo "📥 Veuillez télécharger les fichiers depuis Claude et les placer dans ~/Downloads/"
echo "Puis appuyez sur Entrée pour continuer..."
read

# Copier les fichiers depuis Downloads
cp ~/Downloads/article.rb app/models/
cp ~/Downloads/articles_controller.rb app/controllers/
cp ~/Downloads/admin_articles_controller.rb app/controllers/admin/
cp ~/Downloads/admin_articles_form.html.erb app/views/admin/articles/_form.html.erb
cp ~/Downloads/admin_articles_index.html.erb app/views/admin/articles/index.html.erb
cp ~/Downloads/articles_index_dynamic.html.erb app/views/articles/index.html.erb
cp ~/Downloads/articles_show.html.erb app/views/articles/show.html.erb
cp ~/Downloads/seeds_articles.rb db/seeds/articles.rb

# 4. Ajouter les routes
echo "🛣️ Ajout des routes..."
cat >> config/routes.rb << 'EOF'

  # Blog public
  get 'blog', to: 'articles#index', as: :blog
  get 'blog/:slug', to: 'articles#show', as: :article

  # Admin
  namespace :admin do
    resources :articles do
      member do
        post :publish
        post :unpublish
      end
    end
  end
EOF

# 5. Migrer la base de données
echo "🗄️ Migration de la base de données..."
rails db:migrate

# 6. Ajouter Kaminari au Gemfile
echo "📦 Ajout de la gem Kaminari..."
grep -q "gem 'kaminari'" Gemfile || echo "gem 'kaminari'" >> Gemfile
bundle install

# 7. Seed les articles
echo "🌱 Création des articles exemples..."
rails runner db/seeds/articles.rb

echo "✅ Installation terminée !"
echo "📍 Admin: http://localhost:3000/admin/articles"
echo "📍 Blog: http://localhost:3000/blog"

