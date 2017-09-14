class CreateGuestPages < ActiveRecord::Migration[5.1]
  def change
    create_table :guest_pages do |t|

      t.timestamps
    end
  end
end
