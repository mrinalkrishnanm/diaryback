class AddMoodToNote < ActiveRecord::Migration
  def change
    add_column :notes, :mood, :boolean
  end
end
