class NewslettersController < ApplicationController
  def index
    # Liste de toutes les newsletters (pour la page index)
    @newsletters = [
      {
        id: 'la-sieste',
        number: 1,
        title: 'La Sieste',
        date: 'Septembre 2025',
        excerpt: 'Introduction au sommeil comme acte de résistance. Quiz sur ton profil de dormeur, DIY spray d\'oreiller à la lavande, et témoignage inspirant de Claire.',
        tags: ['🎲 Quiz', '🛠️ DIY', '🌟 Témoignage']
      },
      {
        id: 'le-rituel-du-soir',
        number: 2,
        title: 'Le Rituel du Soir',
        date: 'Octobre 2025',
        excerpt: 'Comment créer ta routine du soir parfaite. Les secrets de la lumière bleue, recette de tisane apaisante, et l\'importance du rituel dans différentes cultures.',
        tags: ['🌍 Cultures', '☕ Recette', '💡 Science']
      },
      {
        id: 'sommeil-et-alimentation',
        number: 3,
        title: 'Sommeil & Alimentation',
        date: 'Novembre 2025',
        excerpt: 'Que manger pour mieux dormir ? Les aliments champions du sommeil, le timing parfait du dernier repas, et 3 recettes pour des nuits réparatrices.',
        tags: ['🍽️ Nutrition', '⏰ Timing', '📖 Recettes']
      }
    ]
  end

  def show
    @newsletter_id = params[:id]

    # Mapper les IDs aux données
    @newsletters_data = {
      'la-sieste' => {
        number: 1,
        title: 'La Sieste',
        subtitle: 'Le sommeil, enfin libéré',
        date: 'Septembre 2025'
      },
      'le-rituel-du-soir' => {
        number: 2,
        title: 'Le Rituel du Soir',
        subtitle: 'Créer ta routine du soir parfaite',
        date: 'Octobre 2025'
      },
      'sommeil-et-alimentation' => {
        number: 3,
        title: 'Sommeil & Alimentation',
        subtitle: 'Que manger pour mieux dormir ?',
        date: 'Novembre 2025'
      }
    }

    @newsletter = @newsletters_data[@newsletter_id]

    # Si la newsletter n'existe pas, rediriger vers l'index
    redirect_to newsletters_path unless @newsletter
  end
end
