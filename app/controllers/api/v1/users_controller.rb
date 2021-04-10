class Api::V1::UsersController < ApplicationController
   
  before_action :set_user, only: [:show, :update, :destroy]
  
  # def current_user 
  #   token = request.headers["Authentication"].split(" ")[1]
  #   payload = decode(token)
  #   user_id = payload["user_id"]
  #   User.find(user_id)
  # end

  def follow
    @followee = User.find(params[:id])
    current_user.followees << @followee
  end

  def unfollow
    @followee = User.find(params[:id])
    current_user.followed_users.find_by(followee_id: @followee.id).destroy
  end

  # check the token sent to us by the client
  # return the user object that the token represents
  def profile
    token = request.headers["Authentication"].split(" ")[1]
    payload = decode(token)
    user_id = payload["user_id"]
    @user = User.find(user_id)
    render json: {
      user: UserSerializer.new(@user) }, 
    status: :accepted
  end

  # GET /users
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.create(user_params)
    if @user.valid?
      # @token = encode_token(user_id: @user.id)
      render json: { user: UserSerializer.new(@user)}, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.permit(:id, :username, :email, :name, :password, :image)
    end
end
