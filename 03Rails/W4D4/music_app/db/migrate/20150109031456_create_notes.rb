class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :note, null: false
      t.integer :user_id, null: false
      t.integer :track_id, null: false

      t.timestamps null: false
    end

    add_index :notes, :user_id #can only index one column at a time unless you index the combination of both
    add_index :notes, :track_id
  end
end
