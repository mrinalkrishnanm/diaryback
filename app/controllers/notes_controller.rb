class NotesController < ApplicationController
	skip_before_filter :verify_authenticity_token
	def show
		@note=Note.find(params[:user_id])
		render json: @note,status: 200
	end
	def create 
		@note=Note.new(note_params)
		if @note.save
			render json: @note, status:200
        else
        	render @note.errors, status:422
        end
	end
	def other_user
     	@note = Note.where('user_id = ?',params[:user_id])
     	render json: @note,status: 200
	end
private
        def note_params
            params.require(:note).permit(:entry,:user_id);
        end
end