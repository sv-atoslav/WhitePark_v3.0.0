class RemoveTitleFromPhotos < ActiveRecord::Migration[5.1]
  def change
    remove_column :photos, :title, :string
  end
end
