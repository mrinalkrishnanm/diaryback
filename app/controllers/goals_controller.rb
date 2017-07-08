class GoalsController < ApplicationController
	skip_before_filter :verify_authenticity_token
  	def index
    	@goal=Goal.all
		render json: @goal, status: 200
  	end

  	def create
		@goal=Goal.new(goal_params)
		if @goal.save
			render json: @goal, status:200
        else
        	render @goal.errors, status:422
        end
	end
	private
        def goal_params
            params.require(:goal).permit(:description);
        end
end
