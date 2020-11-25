class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      rederect_to root_path
    else
      render :new
    end
  end

  private

  def tweet_params
    columns = Tweet.column_symbolized_names
    params.require(:tweet).permit(*columns)
  end
end
