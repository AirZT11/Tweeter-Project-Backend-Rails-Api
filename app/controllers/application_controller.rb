class ApplicationController < ActionController::API
  # include ActionController::Helpers

  def encode_token(payload)
    # should store secret in env variable
    JWT.encode(payload, 'secret', 'HS256')
  end
 
  def auth_header
    # { Authorization: 'Bearer <token>' }
    request.headers['Authorization']
  end
 
  def decode(token)
    JWT.decode(token, 'secret', true, {algorithm: 'HS256'})[0]
  end

end
