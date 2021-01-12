class CategoriesController < ApplicationController
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
end
