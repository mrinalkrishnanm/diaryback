class UsersController < ApplicationController
	skip_before_filter :verify_authenticity_token
	def index
		@user=User.all
		render json: @user, status: 200
	end
	def show
		@user=User.find(params[:id])
		render json: @users,status: 200
	end
	def create 
		@user=User.new(user_params)
		if @user.save
			render json: @user, status:200
        else
        	render @user.errors, status:422
        end
	end
	private
        def user_params
            params.require(:user).permit(:first_name,:last_name,:username,:email,:password);
        end
end
