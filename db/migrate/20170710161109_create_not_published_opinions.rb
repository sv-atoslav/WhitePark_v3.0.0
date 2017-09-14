class CreateNotPublishedOpinions < ActiveRecord::Migration[5.1]
  def change
    create_table :not_published_opinions do |t|
      t.string :author
      t.text :words
      t.date :visit
      t.string :email
      t.integer :phone

      t.timestamps
    end
  end
end
