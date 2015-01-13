class CreateCheers < ActiveRecord::Migration
  def change
    create_table :cheers do |t|
      t.integer :awarder_id, null: false, index: true
      t.integer :goal_id, null: false, index: true
      t.timestamps null: false
    end
  end
end
