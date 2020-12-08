class UsersController < ApplicationController
  before_action :set_user
  before_action :tweets, only: [:show, :task, :record]
  before_action :today, only: [:task]

  def show
  end

  def task
  end

  def record
  end

  def following
    @users = @user.followings
  end

  def followers
    @users = @user.followers
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def tweets
    @tweets = @user.tweets
  end

  def today
    today = Time.current
    month = today.month
    day = today.day
    @today = "#{month}月#{day}日"
  end


end
