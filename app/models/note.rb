class Note < ActiveRecord::Base
	belongs_to :User,foreign_key: :user_id
end
