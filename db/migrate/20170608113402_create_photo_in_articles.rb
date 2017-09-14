class CreatePhotoInArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :photo_in_articles do |t|
      t.integer :photo
      t.integer :article

      t.timestamps
    end
  end
end
