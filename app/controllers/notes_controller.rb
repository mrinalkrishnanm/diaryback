class NotesController < ApplicationController
	skip_before_filter :verify_authenticity_token

  def index
    @notes = Note.where(created_at: (Date.today.beginning_of_month..Date.today.end_of_month))
    render json: @notes, status: 200
  end

	def show
		@note=Note.find(params[:user_id])
		render json: @note,status: 200
	end

  def create
    logger.debug params
    @note = Note.new(
      entry: params[:entry]
      )



    if @note.save
      params.each do |key,value|
        if value.class == ActionDispatch::Http::UploadedFile
          u = Upload.new
          logger.debug value.class
          u.image = value
          u.note_id = @note.id
          @note.uploads << u
        end
      end
    end

    if @note.save!
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
    params.permit(:entry,:title, :image);
  end
end
