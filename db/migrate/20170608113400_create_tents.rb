class CreateTents < ActiveRecord::Migration[5.1]
  def change
    create_table :tents do |t|
      t.string :namesize
      t.string :description
      t.string :string
      t.integer :icon
      t.integer :min_size
      t.integer :max_size
      t.integer :hpb
      t.integer :hpf

      t.timestamps
    end
  end
end
