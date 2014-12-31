class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :answer_id
      t.integer :user_id

      t.timestamps null: false
    end

    add_index :responses, [:answer_id, :user_id]
  end
end
