class CreateSlayders < ActiveRecord::Migration[5.1]
  def change
    create_table :slayders do |t|
      t.string :title

      t.timestamps
    end
  end
end
