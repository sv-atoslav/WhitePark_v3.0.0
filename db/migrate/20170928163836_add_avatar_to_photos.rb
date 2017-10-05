class AddAvatarToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :avatar, :string
  end
end
