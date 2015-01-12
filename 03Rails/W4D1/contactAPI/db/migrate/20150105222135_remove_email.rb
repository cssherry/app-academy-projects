class RemoveEmail < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.remove :name, :email
      t.string :username
    end

    add_index :users, :username
  end
end
