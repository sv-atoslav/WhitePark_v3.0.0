class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.date :published
      t.integer :icon

      t.timestamps
    end
  end
end
