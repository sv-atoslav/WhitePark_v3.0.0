class AddImageUidToPhotos < ActiveRecord::Migration[5.1]
  def change
  	add_column :photos, :image_uid, :string
  end
end
