class AlterGoals < ActiveRecord::Migration
  def change
  	change_column :goals, :completed, :boolean, :default => false
  end
end
