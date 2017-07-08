class TokensController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  def verify
    @user = User.find_by(username: params[:user][:username])
    @flag = @user.valid_password?(params[:user][:password])

    if @flag
      @token = @user.auth_token
      render json: {token: @token}, status: 200
    end
  end


  def verify_token
    @user = User.find_by(auth_token: params[:token])
    if @user
      render json: {user: @user}, status: 200
    end
  end
end
