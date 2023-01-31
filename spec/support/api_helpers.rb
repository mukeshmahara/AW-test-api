module ApiHelpers
  def json
    JSON.parse(response.body)
  end

  
  SECRET_KEY = Rails.application.secret_key_base

  def generate_jwt_token(user)
    payload = {user_id: user.id}
    'Bearer ' + JWT.encode(payload, SECRET_KEY)
  end

end