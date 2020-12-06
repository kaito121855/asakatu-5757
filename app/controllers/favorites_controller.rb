class FavoritesController < ApplicationController
  before_action :set_tweet, only: :destroy
  before_action :authenticate_user!

  def create
    @favorite = current_user.favorites.create(tweet_id: params[:tweet_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @favorite =current_user.favorites.find_by(tweet_id: @tweet.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end

end
