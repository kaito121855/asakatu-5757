class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @tweets = user.tweets
  end

  def task
    user = User.find(params[:id])
    @tweet = user.tweets
    @new = Time.current
  end
end
