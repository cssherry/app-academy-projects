class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.date :birth_date, presence: true
      t.string :color, presence: true
      t.string :name, presence: true
      t.string :sex, limit: 1, presence: true
      t.text :description

      t.timestamps null: false
    end
  end
end
