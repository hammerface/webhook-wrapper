class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :trig_type
      t.string :address

      t.timestamps
    end
    add_index :urls, [:trig_type]
  end
end
