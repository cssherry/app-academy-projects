class Cats < ActiveRecord::Migration
  def change
    add_column :cats, :user_id, :integer, null: false

    add_index :cats, :user_id
    add_index :users, :username, unique: true
  end
end
