class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :body, null: false
      t.string :status, default: "public"
      t.integer :user_id, null: false, index: true

      t.timestamps null: false
    end
  end
end
