class RemoveImageUidFromPhotos < ActiveRecord::Migration[5.1]
  def change
  	remove_column :photos, :image_uid, :string
  end
end
