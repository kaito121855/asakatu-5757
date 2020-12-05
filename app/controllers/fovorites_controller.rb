class FovoritesController < ApplicationController
  before_action :set_tweet
  before_action :authenticate_user!

  def create
    if @tweet.user_id != current_user.user_id
      @favorite = Favorite.create(user_id: current_user.id, tweet_id: @tweet.id)
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, tweet_id: @tweet.id)
    @fovorite.destory
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end

end
