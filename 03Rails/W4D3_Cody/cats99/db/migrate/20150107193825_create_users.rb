class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :username, null: false
      t.text :password_digest, null: false
      t.text :session_token, null: false

      t.timestamps null: false
    end

    add_index :users, :session_token, unique: true

  end
end
