class Note < ActiveRecord::Base
  belongs_to :user
	has_many :uploads
	accepts_nested_attributes_for :uploads, allow_destroy: true

	before_save :duplicate_note

	private 
		def duplicate_note
			@notes = Note.where('DATE(start) = ?', Date.today).count
			if @notes.nil?
				return true
			else
				return false
			end
		end
end
