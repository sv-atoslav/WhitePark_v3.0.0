class RemoveStringFromTent < ActiveRecord::Migration[5.1]
  def change
    remove_column :tents, :string, :string
  end
end
