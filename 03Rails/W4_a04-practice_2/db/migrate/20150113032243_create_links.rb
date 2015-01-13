class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title, null: false, index: true
      t.string :url, null: false, index: true
      t.integer :user_id, null: false, index: true
      t.timestamps
    end
  end
end
