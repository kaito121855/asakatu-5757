class CategoriesController < ApplicationController
  before_action :set_achievement_ranking
  
  def index
    @tweets = Tweet.includes(:user).order('tweets.created_at DESC')
  end

  def training
    @tweets = Tweet.where(category_id: 2).order('tweets.created_at DESC')
  end

  def walking
    @tweets = Tweet.where(category_id: 3).order('tweets.created_at DESC')
  end

  def study
    @tweets = Tweet.where(category_id: 4).order('tweets.created_at DESC')
  end

  def health
    @tweets = Tweet.where(category_id: 5).order('tweets.created_at DESC')
  end

  def housework
    @tweets = Tweet.where(category_id: 6).order('tweets.created_at DESC')
  end

  def search
    @tweets = Tweet.search(params[:keyword])
  end

  private

  def set_achievement_ranking
    @achievement_ranking = User.find(Achievement.group(:user_id).order('count(user_id) DESC').limit(5).pluck(:user_id))
  end
end
