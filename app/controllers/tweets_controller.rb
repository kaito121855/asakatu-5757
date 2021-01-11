class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show]

  def index
    @tweets = Tweet.includes(:user).order('tweets.created_at DESC')
    user = User.find(current_user.id)
    follow_users = user.followings
    @follow_tweets = @tweets.where(user_id: follow_users).or(@tweets.where(user_id: current_user)).order('created_at DESC')
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  def edit
  end

  def update
    redirect_to tweets_path if @tweet.update(tweet_params)
  end

  def destroy
    redirect_to tweets_path if @tweet.destroy
  end

  private

  def tweet_params
    params.require(:tweet).permit(:task, :category_id, :detalis, :start_hour_id, :start_minute_id, :end_hour_id, :end_minute_id,
                                  :detalis).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
