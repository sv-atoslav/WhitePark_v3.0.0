class CreateOpinions < ActiveRecord::Migration[5.1]
  def change
    create_table :opinions do |t|
      t.string :author
      t.text :words
      t.date :visit

      t.timestamps
    end
  end
end
