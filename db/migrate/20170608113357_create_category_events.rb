class CreateCategoryEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :category_events do |t|
      t.string :title
      t.string :description
      t.integer :icon

      t.timestamps
    end
  end
end
