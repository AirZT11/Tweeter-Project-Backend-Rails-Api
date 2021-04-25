class ApplicationController < ActionController::API
  # include ActionController::Helpers

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

end
