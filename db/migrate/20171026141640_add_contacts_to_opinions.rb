class AddContactsToOpinions < ActiveRecord::Migration[5.1]
  def change
    add_column :opinions, :published, :boolean, default: false
    add_column :opinions, :email, :string
    add_column :opinions, :phone, :bigint, limit: 16
  end
end
