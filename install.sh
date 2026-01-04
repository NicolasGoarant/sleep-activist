#!/bin/bash

# Script d'installation Sleep Activists
# Utilisez ce script après avoir créé le projet Rails

echo "🌙 Installation Sleep Activists"
echo "================================"
echo ""

# Copier le CSS
echo "📝 Copie du fichier CSS..."
cp sleep_activist.css app/assets/stylesheets/

# Copier le layout
echo "📝 Copie du layout..."
cp application.html.erb app/views/layouts/

# Créer le dossier shared s'il n'existe pas
mkdir -p app/views/shared

# Copier les partials
echo "📝 Copie des partials..."
cp _navigation.html.erb app/views/shared/
cp _footer.html.erb app/views/shared/

# Copier les vues
echo "📝 Copie des vues..."
cp home.html.erb app/views/pages/

# Copier les routes
echo "📝 Copie des routes..."
cp routes.rb config/

echo ""
echo "✅ Installation terminée !"
echo ""
echo "📝 N'oubliez pas de :"
echo "1. Copier votre logo dans app/assets/images/logo.jpg"
echo "2. Lancer le serveur avec: rails server"
echo ""
