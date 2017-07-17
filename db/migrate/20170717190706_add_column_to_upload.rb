class AddColumnToUpload < ActiveRecord::Migration
  def change
  	add_column :uploads, :note_id, :integer
  end
end
