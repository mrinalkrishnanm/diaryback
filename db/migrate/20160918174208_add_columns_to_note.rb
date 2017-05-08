class AddColumnsToNote < ActiveRecord::Migration
  def change
    add_column :notes, :entry, :string
  end
end
