# db/seeds/articles.rb
# Pour exécuter : rails db:seed ou rails runner db/seeds/articles.rb

puts "🌱 Création d'articles exemples..."

articles_data = [
  {
    title: "L'apnée du sommeil : au-delà du diagnostic médical",
    slug: "apnee-du-sommeil-diagnostic-medical",
    excerpt: "L'apnée obstructive du sommeil touche des millions de personnes. Mais au-delà des chiffres et du diagnostic médical, que signifie vraiment vivre avec ce syndrome ?",
    content: <<~CONTENT,
      L'apnée obstructive du sommeil (AOS) se caractérise par des arrêts respiratoires répétés pendant le sommeil. Souvent réduite à un "problème de ronflement", elle cache une réalité bien plus complexe : fatigue chronique, risques cardiovasculaires, impact sur la vie sociale et professionnelle.

      ## Le poids du regard des autres

      Porter un masque CPAP (ventilation en pression positive continue) la nuit peut être vécu comme une épreuve. "Mon conjoint va me trouver ridicule", "Je ne peux plus dormir ailleurs que chez moi" : ces craintes sont légitimes. Sleep Activists refuse de moraliser : oui, c'est difficile. Non, vous n'êtes pas seul.

      ## Au-delà du traitement : repenser son sommeil

      Le traitement médical est essentiel. Mais il ne suffit pas. Il faut aussi :

      - Aménager sa chambre pour rendre le masque moins invasif
      - En parler librement avec ses proches
      - Rejoindre des communautés de soutien
      - Se réapproprier son sommeil, sans culpabilité

      L'apnée du sommeil n'est pas une fatalité. C'est un phénomène médical, certes, mais aussi social : il interroge notre rapport au corps, à la nuit, au regard des autres.
    CONTENT
    emoji: "😴",
    category: "Santé",
    reading_time: 8,
    cover_gradient: "linear-gradient(135deg, rgba(255, 217, 61, 0.2), rgba(184, 181, 232, 0.2))",
    published: true,
    author: "Nicolas Goarant"
  },
  {
    title: "Comment choisir son matelas sans se perdre",
    slug: "choisir-matelas-sans-se-perdre",
    excerpt: "Mousse, ressorts, latex, mémoire de forme : le marché de la literie regorge de promesses marketing. Voici les vraies questions à se poser pour trouver le matelas qui vous convient.",
    content: <<~CONTENT,
      "Le meilleur matelas pour votre dos", "Révolutionnaire", "Recommandé par les ostéopathes" : le marketing de la literie joue sur vos craintes. La vérité ? Il n'existe pas de matelas universel. Chaque corps, chaque sommeil est unique.

      ## Les vraies questions à se poser

      Avant d'acheter, demandez-vous :

      - Avez-vous chaud la nuit ? (Préférez latex ou ressorts)
      - Dormez-vous sur le dos, le côté, le ventre ? (Fermeté différente)
      - Votre morphologie : un matelas ferme n'est pas toujours mieux
      - Dormez-vous seul ou à deux ? (Indépendance de couchage)
      - Votre budget : un bon matelas coûte entre 500€ et 1500€

      ## Nos conseils pratiques

      Testez ! Les 100 nuits d'essai sont une vraie opportunité. Un matelas, ça se teste allongé, pas en 2 minutes dans un magasin.

      Changez régulièrement. Un matelas se garde 7 à 10 ans maximum. Au-delà, il perd ses propriétés.

      Le sommier compte aussi. Un bon matelas sur un mauvais sommier, c'est 50% de confort perdu.

      Votre lit n'est pas un accessoire. C'est l'endroit où vous passez un tiers de votre vie. Investir dans une literie de qualité, c'est investir dans votre sommeil.
    CONTENT
    emoji: "🛏️",
    category: "Conseils",
    reading_time: 6,
    cover_gradient: "linear-gradient(135deg, rgba(184, 181, 232, 0.2), rgba(255, 217, 61, 0.2))",
    published: true,
    author: "Nicolas Goarant"
  },
  {
    title: "Parentalité et sommeil : sortir de la culpabilité",
    slug: "parentalite-sommeil-culpabilite",
    excerpt: "Mon bébé ne fait pas ses nuits. Des millions de parents prononcent cette phrase chaque jour, souvent avec culpabilité. Et si on arrêtait de chercher des solutions miracles ?",
    content: <<~CONTENT,
      "À 6 mois, un bébé doit faire ses nuits." Faux. Biologiquement, un nourrisson a besoin de se réveiller la nuit pour se nourrir, se rassurer, réguler sa température. Ce n'est pas un échec parental. C'est une réalité physiologique.

      ## L'épuisement parental : un tabou

      "Profite, ça passe vite !" On minimise. On culpabilise. Pourtant, la fatigue parentale est réelle, intense, parfois dangereuse. Sleep Activists refuse de vous dire "c'est normal, tiens bon". Oui, c'est normal. Non, ce n'est pas facile. Et oui, vous avez le droit de craquer.

      ## Des pistes concrètes (sans injonctions)

      - Le cododo : pratique, sûr si bien fait, et vous sauve des nuits
      - Alternez avec votre conjoint.e : la fatigue ne doit pas être genrée
      - Demandez de l'aide : famille, amis, associations
      - Dormez quand bébé dort : oui, vraiment
      - Lâchez prise sur le reste : le ménage peut attendre

      ## Et les méthodes miracles ?

      "Laissez-le pleurer", "La méthode 5-10-15", "Les rituels infaillibles" : méfiez-vous des promesses. Chaque enfant est unique. Ce qui marche pour l'un ne marchera pas pour l'autre. Faites-vous confiance. Écoutez votre instinct.

      Être parent.e épuisé.e ne fait pas de vous un.e mauvais.e parent.e. Ça fait de vous un être humain qui a besoin de dormir. Et c'est légitime.
    CONTENT
    emoji: "👶",
    category: "Parentalité",
    reading_time: 7,
    cover_gradient: "linear-gradient(135deg, rgba(255, 217, 61, 0.3), rgba(184, 181, 232, 0.15))",
    published: true,
    author: "Nicolas Goarant"
  },
  {
    title: "Travailleurs de nuit : l'invisibilité du sommeil décalé",
    slug: "travailleurs-nuit-invisibilite-sommeil",
    excerpt: "Infirmières, agents de sécurité, chauffeurs : des millions de personnes vivent à contretemps. Leur sommeil est une lutte quotidienne que la société ignore.",
    content: <<~CONTENT,
      En France, près de 3,5 millions de personnes travaillent la nuit. Infirmières, agents de sécurité, chauffeurs de bus, boulagers : ils font tourner la société pendant que les autres dorment. Mais leur sommeil, lui, reste invisible.

      ## Dormir à contretemps : un défi biologique

      Le corps humain est programmé pour dormir la nuit. La mélatonine, l'hormone du sommeil, se sécrète naturellement dans l'obscurité. Travailler de nuit, c'est lutter contre sa propre biologie.

      Les conséquences sont réelles : troubles du sommeil, fatigue chronique, risques cardiovasculaires accrus, isolement social.

      ## L'invisibilité sociale

      "Tu dors la journée, tu as de la chance !" Cette phrase, beaucoup de travailleurs de nuit l'entendent. Comme si dormir de 8h à 16h était un privilège. Comme si le bruit des travaux, la lumière du jour, les appels téléphoniques n'existaient pas.

      Le sommeil des travailleurs de nuit est dévalué, voire moqué. "Tu es fatigué ? Mais tu ne fais rien de ta journée !"

      ## Repenser l'organisation du travail

      Le travail de nuit est nécessaire. Mais il doit être reconnu, valorisé, protégé. Cela passe par :

      - Des horaires fixes (éviter les rotations)
      - Des temps de récupération suffisants
      - Une reconnaissance sociale et salariale
      - Un accompagnement médical adapté

      Le sommeil décalé n'est pas un choix. C'est une réalité subie par des millions de personnes. Il est temps de la rendre visible.
    CONTENT
    emoji: "🌃",
    category: "Société",
    reading_time: 10,
    cover_gradient: "linear-gradient(135deg, rgba(184, 181, 232, 0.25), rgba(255, 217, 61, 0.15))",
    published: true,
    author: "Nicolas Goarant"
  }
]

articles_data.each do |data|
  article = Article.find_or_create_by(slug: data[:slug]) do |a|
    a.assign_attributes(data)
    a.published_at = Time.current if a.published?
  end
  
  if article.persisted?
    puts "✅ Article créé : #{article.title}"
  else
    puts "❌ Erreur : #{article.errors.full_messages.join(', ')}"
  end
end

puts "🎉 Seed terminé ! #{Article.count} articles au total."
