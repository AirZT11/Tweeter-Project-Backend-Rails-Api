class ApplicationController < ActionController::API
  # before_action :authorized

  def encode_token(payload)
    # should store secret in env variable
    JWT.encode(payload, ENV['MY_SECRET'], 'HS256')
  end
 
  def auth_header
    # { Authorization: 'Bearer <token>' }
    request.headers['Authorization']
  end
 
  def decode(token)
    JWT.decode(token, ENV['MY_SECRET'], true, {algorithm: 'HS256'})[0]
  end

  # def current_user 
  #   token = request.headers["Authentication"].split(" ")[1]
  #   payload = decode(token)
  #   user_id = payload["user_id"]
  #   User.find(user_id)
  # end
end
