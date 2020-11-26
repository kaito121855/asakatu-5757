class TweetsController < ApplicationController
  before_action :set_tweet, only: [:destroy, :edit]

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

  def edit
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
