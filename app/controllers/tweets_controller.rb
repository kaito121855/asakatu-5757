class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to root_path
    end
  end

  def destroy
    if @tweet.destroy
      redirect_to root_path
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:task, :detalis, :start_hour_id, :start_minute_id, :end_hour_id, :end_minute_id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
