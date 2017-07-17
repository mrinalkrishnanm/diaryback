class UploadsController < ApplicationController
	skip_before_filter :verify_authenticity_token
	
	def create
		logger.debug params[:upload]
		save_flag = false
		params.each do |key, value|
			@upload = Upload.new;
			@upload.image = params[key]
			if @upload.save
				save_flag = true
		    else
				save_flag = false
		    end

    	end

    	if save_flag
    		render text: "saved", status: 200
    	else
    		render text: "cant save", status: 422
    	end

	end
	
	private
        def upload_params
            params.require(:upload).permit(:images=>[]);
        end
end


