class Note < ActiveRecord::Base
	belongs_to :User,foreign_key: :user_id
	has_many :uploads
	accepts_nested_attributes_for :uploads, allow_destroy: true
end
