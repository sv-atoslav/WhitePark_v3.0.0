class CreatePhotoInEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :photo_in_events do |t|
      t.integer :photo
      t.integer :event

      t.timestamps
    end
  end
end
