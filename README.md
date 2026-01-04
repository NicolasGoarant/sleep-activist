# 🌙 Sleep Activists - Installation Rails

## Étape 1 : Créer le projet Rails

```bash
# Dans votre dossier Documents
rails new sleep-activist --skip-tailwind --skip-test
cd sleep-activist
```

## Étape 2 : Générer le contrôleur

```bash
rails generate controller Pages home mission contenus presse apropos newsletter
```

## Étape 3 : Créer les dossiers nécessaires

```bash
mkdir -p app/assets/images
mkdir -p app/views/shared
```

## Étape 4 : Copier les fichiers téléchargés

Téléchargez tous les fichiers depuis Claude et placez-les dans le dossier `sleep-activist`.

Ensuite, exécutez le script d'installation :

```bash
chmod +x install.sh
./install.sh
```

**OU copiez manuellement chaque fichier :**

```bash
# Copier le CSS
cp sleep_activist.css app/assets/stylesheets/

# Copier le layout
cp application.html.erb app/views/layouts/

# Copier les partials
cp _navigation.html.erb app/views/shared/
cp _footer.html.erb app/views/shared/

# Copier la vue home
cp home.html.erb app/views/pages/

# Copier les routes
cp routes.rb config/
```

## Étape 5 : Ajouter le logo

```bash
# Copiez votre logo dans le dossier assets
cp ~/Downloads/Sleep_activist_bleu_original_débug.jpg app/assets/images/logo.jpg
```

## Étape 6 : Lancer le serveur

```bash
rails server
```

Puis ouvrez votre navigateur sur : **http://localhost:3000**

---

## 📁 Structure des fichiers à copier

Vous devriez avoir téléchargé :
- `sleep_activist.css` → va dans `app/assets/stylesheets/`
- `application.html.erb` → va dans `app/views/layouts/`
- `_navigation.html.erb` → va dans `app/views/shared/`
- `_footer.html.erb` → va dans `app/views/shared/`
- `home.html.erb` → va dans `app/views/pages/`
- `routes.rb` → va dans `config/`
- `install.sh` → à la racine du projet (optionnel)

---

## ❓ En cas de problème

**Le CSS ne s'applique pas ?**
Vérifiez que `app/assets/stylesheets/sleep_activist.css` existe et redémarrez le serveur.

**Erreur "undefined method root_path" ?**
Vérifiez que `config/routes.rb` a bien été copié.

**Le logo ne s'affiche pas ?**
Vérifiez que le fichier existe dans `app/assets/images/logo.jpg`

**Le serveur ne démarre pas ?**
Essayez : `bundle install` puis `rails server`

---

## 🎯 Pages disponibles

- **Accueil** : http://localhost:3000
- **Mission** : http://localhost:3000/mission
- **Contenus** : http://localhost:3000/contenus
- **Presse** : http://localhost:3000/presse
- **À propos** : http://localhost:3000/apropos
- **Newsletter** : http://localhost:3000/newsletter

---

## 📝 Prochaines étapes (optionnel)

Pour compléter le site, vous pouvez créer les autres vues :
- `app/views/pages/mission.html.erb`
- `app/views/pages/contenus.html.erb`
- `app/views/pages/presse.html.erb`
- `app/views/pages/apropos.html.erb`
- `app/views/pages/newsletter.html.erb`

Je peux vous les fournir si besoin !
