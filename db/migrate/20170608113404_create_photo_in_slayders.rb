class CreatePhotoInSlayders < ActiveRecord::Migration[5.1]
  def change
    create_table :photo_in_slayders do |t|
      t.integer :photo
      t.integer :slyder

      t.timestamps
    end
  end
end
