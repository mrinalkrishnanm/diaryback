class RemoveTokenCreatedAtConstraintFromUser < ActiveRecord::Migration
  def change
    change_column :users, :token_created_at, :datetime, :null => true
  end
end
