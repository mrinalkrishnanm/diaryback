class ChangeNoteTableColumnType < ActiveRecord::Migration
  def change
  	change_column(:notes, :entry, :text)
  end
end
