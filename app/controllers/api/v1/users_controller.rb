class Api::V1::UsersController < Api::ApiController
  before_action :authenticate, except: %i[create]
  before_action :authenticate, only: [:auto_login]
  
  # REGISTER
  def create
    @user = User.new(user_params)
    if @user.save
      @token = encode_token({user_id: @user.id})
      render json: UserSerializer.new( @user, {params: {token: @token, name: @user.full_name} }), status: 201
    else
      render json: {error: @user.errors}, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :country, :password, :email)
  end

end
