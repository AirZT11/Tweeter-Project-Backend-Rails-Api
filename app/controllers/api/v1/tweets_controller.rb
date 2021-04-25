class Api::V1::TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :update, :destroy]
  # skip_before_action :authorized

  # GET /tweets
  def index
    @tweets = Tweet.all.order('tweets.created_at DESC')
    render json: @tweets
  end

  # GET /tweets_users
  def user_follow_tweets
    token = request.headers["Authentication"].split(" ")[1]
    payload = decode(token)
    user_id = payload["user_id"]
    @user = User.find(user_id)
    @tweets = Tweet.from_users_followed_by(@user).order('tweets.created_at DESC')
    render json: @tweets
  end

  # GET /user_tweets
  def user_specific_tweets
    user_id = request.headers['UserId']
    @user = User.find(user_id)
    @tweets = Tweet.from_user(@user).order('tweets.created_at DESC')
    render json: @tweets
  end

  # GET /tweets/1
  def show
    render json: @tweet
  end

  # POST /tweets
  def create
    @tweet = Tweet.create(tweet_params)
    if @tweet.valid?
      render json: {
      tweet: TweetSerializer.new(@tweet)}, 
      status: :created, location: api_v1_tweets_path(@tweet)
    else
      render json: {
        errors: @tweet.errors, 
        status: :unprocessable_entity
      }
    end
  end

  # PATCH/PUT /tweets/1
  def update
    if @tweet.update(tweet_params)
      render json: @tweet
    else
      render json: @tweet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tweets/1
  def destroy
    @tweet.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tweet_params
      params.permit(:message, :user_id, :image)
    end
end
