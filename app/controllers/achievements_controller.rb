class AchievementsController < ApplicationController
  before_action :set_tweet
  before_action :authenticate_user!

  def create
    @achievement = current_user.achievements.create(tweet_id: params[:tweet_id])
  end

  def destroy
    @achievement =current_user.achievements.find_by(tweet_id: @tweet.id)
    @achievement.destroy
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end

end
