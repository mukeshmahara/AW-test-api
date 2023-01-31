class Api::SessionController < ApplicationController
  before_action :authorize, only: [:auto_login]

   # LOGGING IN
   def login
    @user = User.find_by(email: params[:auth][:email])
    if @user && @user.authenticate(params[:auth][:password])
      token = encode_token({user_id: @user.id})
      render json: {token: token, email: @user.email, name: @user.full_name}, status: 200
    else
      render json: {error: "Invalid username or password"}
    end
  end


  def auto_login
    render json: @user
  end

end
