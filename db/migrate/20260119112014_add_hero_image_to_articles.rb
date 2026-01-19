class AddHeroImageToArticles < ActiveRecord::Migration[7.2]
  def change
    add_column :articles, :hero_image, :string
  end
end
