class CreateArticles < ActiveRecord::Migration[7.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :slug
      t.text :excerpt
      t.text :content
      t.string :emoji
      t.string :category
      t.integer :reading_time
      t.string :cover_image_url
      t.string :cover_gradient
      t.boolean :published
      t.datetime :published_at
      t.string :author
      t.integer :views_count

      t.timestamps
    end
  end
end
