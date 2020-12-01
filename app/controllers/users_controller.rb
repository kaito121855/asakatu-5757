class UsersController < ApplicationController
  before_action :user, only: [:show, :task]
  before_action :tweets, only: [:show, :task]
  before_action :today, only: [:task]

  def show
    @nickname = user.nickname
  end

  def task
  end

  private

  def user
    user = User.find(params[:id])
  end

  def tweets
    @tweets = user.tweets
  end

  def today
    today = Time.current
    @month = today.month
    @day = today.day
  end


end
