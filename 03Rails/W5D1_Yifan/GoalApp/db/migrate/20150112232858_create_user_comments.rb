class CreateUserComments < ActiveRecord::Migration
  def change
    create_table :user_comments do |t|
      t.string :body, null: false
      t.integer :user_id, null: false, index: true
      t.integer :parent_id, index: true
      t.timestamps null: false
    end
  end
end
