class AddColumnToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :completed, :string, default: false #AddColumnToGoals completed
  end
end
