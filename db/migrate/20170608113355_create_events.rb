class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.integer :category
      t.string :title
      t.string :description
      t.integer :icon

      t.timestamps
    end
  end
end
