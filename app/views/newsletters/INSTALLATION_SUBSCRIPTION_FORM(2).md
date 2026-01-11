# 📧 Installation Formulaire d'Inscription Newsletter

## 🎯 Ce qui va se passer

1. User clique sur "S'inscrire" → Redirigé vers `/subscribers/new`
2. User remplit le formulaire (email + prénom/nom optionnels)
3. Validation → Email envoyé à **nicolas@sleep-activist.fr**
4. User redirigé vers page de remerciement
5. User reçoit un email de bienvenue

---

## 📦 Fichiers à installer

### 1. Migration
```
db/migrate/YYYYMMDDHHMMSS_create_subscribers.rb
```

### 2. Modèle
```
app/models/subscriber.rb
```

### 3. Contrôleur
```
app/controllers/subscribers_controller.rb
```

### 4. Mailer
```
app/mailers/subscriber_mailer.rb
```

### 5. Vues
```
app/views/subscribers/
├── new.html.erb          # Formulaire
└── thank_you.html.erb    # Page de remerciement

app/views/subscriber_mailer/
├── notify_admin.html.erb          # Email pour toi
└── welcome_subscriber.html.erb    # Email pour le subscriber
```

### 6. CSS
```
app/assets/stylesheets/subscribers.css
```

### 7. Routes
```
config/routes.rb
```

---

## 🚀 Installation étape par étape

### Étape 1 : Créer la migration

```bash
cd ~/sleep-activist

# Créer le fichier de migration
rails generate migration CreateSubscribers

# Remplacer son contenu par celui de create_subscribers.rb
```

Ou copier directement :
```bash
cp ~/Téléchargements/create_subscribers.rb db/migrate/$(date +%Y%m%d%H%M%S)_create_subscribers.rb
```

Puis :
```bash
rails db:migrate
```

### Étape 2 : Créer le modèle

```bash
# Créer le fichier
touch app/models/subscriber.rb

# Copier le contenu
cp ~/Téléchargements/subscriber.rb app/models/
```

### Étape 3 : Créer le contrôleur

```bash
cp ~/Téléchargements/subscribers_controller.rb app/controllers/
```

### Étape 4 : Créer le mailer

```bash
cp ~/Téléchargements/subscriber_mailer.rb app/mailers/
```

### Étape 5 : Créer les vues

```bash
# Créer les dossiers
mkdir -p app/views/subscribers
mkdir -p app/views/subscriber_mailer

# Copier les vues
cp ~/Téléchargements/new.html.erb app/views/subscribers/
cp ~/Téléchargements/thank_you.html.erb app/views/subscribers/
cp ~/Téléchargements/notify_admin.html.erb app/views/subscriber_mailer/
cp ~/Téléchargements/welcome_subscriber.html.erb app/views/subscriber_mailer/
```

### Étape 6 : Ajouter le CSS

```bash
cp ~/Téléchargements/subscribers.css app/assets/stylesheets/
```

### Étape 7 : Mettre à jour les routes

```bash
cp ~/Téléchargements/routes_with_subscribers.rb config/routes.rb
```

### Étape 8 : Mettre à jour le bouton dans index.html.erb

Dans `app/views/newsletters/index.html.erb`, remplace la section CTA par :

```erb
<div class="newsletter-cta-box">
  <h3>📧 Inscris-toi à la newsletter</h3>
  <p>Reçois chaque mois nos conseils, astuces et découvertes directement dans ta boîte mail.</p>
  <%= link_to "S'inscrire gratuitement", new_subscriber_path, class: "cta-button" %>
</div>
```

### Étape 9 : Configurer l'envoi d'emails

**Option A : En développement (LetterOpener - Recommandé pour tester)**

```ruby
# Gemfile
gem 'letter_opener', group: :development

# config/environments/development.rb
config.action_mailer.delivery_method = :letter_opener
config.action_mailer.perform_deliveries = true
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
```

Puis :
```bash
bundle install
```

Les emails s'ouvriront dans ton navigateur !

**Option B : En production (Gmail SMTP)**

```ruby
# config/environments/production.rb
config.action_mailer.delivery_method = :smtp
config.action_mailer.default_url_options = { host: 'sleep-activist.fr' }
config.action_mailer.smtp_settings = {
  address: 'smtp.gmail.com',
  port: 587,
  domain: 'sleep-activist.fr',
  user_name: ENV['GMAIL_USERNAME'],
  password: ENV['GMAIL_PASSWORD'],
  authentication: 'plain',
  enable_starttls_auto: true
}
```

Puis configure les variables d'environnement :
```bash
# .env (à créer à la racine)
GMAIL_USERNAME=ton-email@gmail.com
GMAIL_PASSWORD=ton-app-password
```

**⚠️ Important :** Utilise un "App Password" Gmail, pas ton mot de passe normal :
1. Va sur https://myaccount.google.com/apppasswords
2. Crée un mot de passe d'application
3. Utilise-le dans `.env`

**Option C : SendGrid (Recommandé en production)**

```ruby
# Gemfile
gem 'sendgrid-ruby'

# config/environments/production.rb
config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  address: 'smtp.sendgrid.net',
  port: 587,
  user_name: 'apikey',
  password: ENV['SENDGRID_API_KEY'],
  authentication: :plain,
  enable_starttls_auto: true
}
```

SendGrid offre 100 emails/jour gratuits.

### Étape 10 : Redémarrer

```bash
rm -rf tmp/cache/*
rails s
```

---

## 🧪 Tester

1. Va sur `/newsletters`
2. Clique sur "S'inscrire gratuitement"
3. Remplis le formulaire
4. Vérifie :
   - Email reçu sur nicolas@sleep-activist.fr
   - Page de remerciement affichée
   - Email de bienvenue envoyé

---

## 📊 Voir les inscrits

Dans la console Rails :

```bash
rails console

# Voir tous les inscrits
Subscriber.all

# Compter
Subscriber.count

# Exporter en CSV
require 'csv'
CSV.open('subscribers.csv', 'w') do |csv|
  csv << ['Email', 'Prénom', 'Nom', 'Date inscription']
  Subscriber.all.each do |s|
    csv << [s.email, s.first_name, s.last_name, s.created_at]
  end
end
```

---

## 🔧 Personnalisation

### Changer l'email de destination

Dans `app/mailers/subscriber_mailer.rb`, ligne 6 :
```ruby
to: 'nicolas@sleep-activist.fr'  # Change ici
```

### Ajouter des champs au formulaire

1. Migration :
```bash
rails generate migration AddFieldsToSubscribers phone:string city:string
rails db:migrate
```

2. Formulaire (new.html.erb) :
```erb
<div class="form-field">
  <%= f.text_field :phone, placeholder: "Téléphone", class: "form-input" %>
</div>
```

3. Contrôleur (subscribers_controller.rb) :
```ruby
def subscriber_params
  params.require(:subscriber).permit(:email, :first_name, :last_name, :phone, :city)
end
```

---

## 🐛 Dépannage

### Les emails ne sont pas envoyés

1. Vérifie la configuration SMTP
2. Regarde les logs : `tail -f log/development.log`
3. En dev, utilise `letter_opener`

### Erreur "Email already taken"

L'email existe déjà en base. C'est normal, la validation empêche les doublons.

### Page blanche après soumission

Vérifie que tu as bien créé `thank_you.html.erb` dans `app/views/subscribers/`

---

## ✅ Checklist finale

- [ ] Migration exécutée
- [ ] Modèle créé
- [ ] Contrôleur créé
- [ ] Mailer créé
- [ ] Vues créées (4 fichiers)
- [ ] CSS ajouté
- [ ] Routes mises à jour
- [ ] Bouton dans index.html.erb mis à jour
- [ ] Config email (letter_opener ou SMTP)
- [ ] Testé en local

---

**C'est prêt ! Les inscriptions arriveront directement sur nicolas@sleep-activist.fr ! 📧✨**
