class Note < ActiveRecord::Base
  belongs_to :user
	has_many :uploads
	accepts_nested_attributes_for :uploads, allow_destroy: true
end
