class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :description
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
