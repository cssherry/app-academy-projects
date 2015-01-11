class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name, null: false
      t.integer :album_id, null: false
      t.string :type_track, null: false
      t.timestamps null: false
    end

    add_index :tracks, [:name, :album_id], unique: true
    add_index :tracks, :name
    add_index :tracks, :album_id
  end
end