class Api::SessionController < Api::ApiController

   # LOGGING IN
   def login
    @user = User.find_by(email: params[:auth][:email])
    if @user && @user.authenticate(params[:auth][:password])
      token = encode_token({user_id: @user.id})
      render json: UserSerializer.new(@user, {params: {token: token, name: @user.full_name} }), status: 200
    else
      render json: {error: "Invalid email or password"}, status: 403
    end
  end


  def auto_login
    render json: @user
  end

end
