class ApplicationController < ActionController::Base
  include Pundit::Authorization
  before_action :authenticate
  rescue_from ActiveRecord::RecordNotFound, with: :handle_error


  SECRET_KEY = Rails.application.secret_key_base
  def encode_token(payload)
    JWT.encode(payload, SECRET_KEY)
  end

  def auth_header
    # { Authorization: 'Bearer <token>' }
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      
      token = auth_header.split(' ')[1]
      # header: { 'Authorization': 'Bearer <token>' }
      begin
        JWT.decode(token, SECRET_KEY, true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def logged_in_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end

  def logged_in?
    !!logged_in_user
  end

  def authorize
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end

  private
  def handle_error(e)
    render json: {error:e.to_s}, status: :not_found
  end
end
