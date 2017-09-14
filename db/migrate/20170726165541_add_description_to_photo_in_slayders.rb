class AddDescriptionToPhotoInSlayders < ActiveRecord::Migration[5.1]
  def change
    add_column :photo_in_slayders, :description, :string
  end
end
