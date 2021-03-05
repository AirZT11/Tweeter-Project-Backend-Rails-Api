class ApplicationController < ActionController::API
  # before_action :authorized

  def encode_token(payload)
    # should store secret in env variable
    JWT.encode(payload, 'MY_SECRET', 'HS256')
  end
 
  def auth_header
    # { Authorization: 'Bearer <token>' }
    request.headers['Authorization']
  end
 
  def decode(token)
    # if auth_header
      # token = auth_header.split(' ')[1]

      # begin
        JWT.decode(token, 'MY_SECRET', true, {algorithm: 'HS256'})[0]
      # # rescue JWT::DecodeError
      #   nil
      # end
    # end
  end
 
  # def current_user
  #   if decode
  #     user_id = decode[0]['user_id']
  #     @user = User.find_by(id: user_id)
  #   end
  # end
 
  # def logged_in?
  #   # using !! allows #current_user to return a boolean instead of the object itself
  #   !!current_user
  # end
 
  # def authorized
  #   render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  # end
end
