class UsersController < ApplicationController
  before_action :set_user
  before_action :tweets, only: [:show, :task, :record]
  before_action :today, only: [:task, :record]
  before_action :week, only: [:record]
  before_action :time_sum, only: [:record]

  def show
  end

  def task
  end

  def record
    @week_achievement = { @six_days_ago => @six_day_achievement, @five_days_ago => @five_day_achievement, @four_days_ago => @four_day_achievement, @three_days_ago => @three_day_achievement,@two_days_ago => @two_day_achievement, @one_days_ago => @one_day_achievement, @today => @today_achievement, }
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
    @tweets = @user.tweets.order('created_at DESC')
  end

  def today
    today = Time.current
    month = today.month
    day = today.day
    @today = "#{month}月#{day}日"
    @achievements = Achievement.where(user_id: params[:id])
    today_achievement = []
    @achievements.each do |achievement|
      if @today == achievement.updated_at.strftime("%m月%-d日")
        today_achievement << achievement 
      end
      @today_achievement = today_achievement.count
    end
  end

  def week
    today = Time.current
    yesterday = today.yesterday
    month = yesterday.month
    day = yesterday.day
    @one_days_ago = "#{month}月#{day}日"
    @achievements = Achievement.where(user_id: params[:id])
    one_day_achievement = []
    @achievements.each do |achievement|
      if @one_days_ago == achievement.updated_at.strftime("%m月%-d日")
        one_day_achievement << achievement 
      end
      @one_day_achievement = one_day_achievement.count
    end

    two_day = today.ago(2.days)
    month = two_day.month
    day = two_day.day
    @two_days_ago = "#{month}月#{day}日"
    @achievements = Achievement.where(user_id: params[:id])
    two_day_achievement = []
    @achievements.each do |achievement|
      if @two_days_ago == achievement.updated_at.strftime("%m月%-d日")
        two_day_achievement << achievement 
      end
      @two_day_achievement = two_day_achievement.count
    end

    three_day = today.ago(3.days)
    month = three_day.month
    day = three_day.day
    @three_days_ago = "#{month}月#{day}日"
    @achievements = Achievement.where(user_id: params[:id])
    three_day_achievement = []
    @achievements.each do |achievement|
      if @three_days_ago == achievement.updated_at.strftime("%m月%-d日")
        three_day_achievement << achievement 
      end
      @three_day_achievement = three_day_achievement.count
    end

    four_day = today.ago(4.days)
    month = four_day.month
    day = four_day.day
    @four_days_ago = "#{month}月#{day}日"
    @achievements = Achievement.where(user_id: params[:id])
    four_day_achievement = []
    @achievements.each do |achievement|
      if @four_days_ago == achievement.updated_at.strftime("%m月%-d日")
        four_day_achievement << achievement 
      end
      @four_day_achievement = four_day_achievement.count
    end

    five_day = today.ago(5.days)
    month = five_day.month
    day = five_day.day
    @five_days_ago = "#{month}月#{day}日"
    @achievements = Achievement.where(user_id: params[:id])
    five_day_achievement = []
    @achievements.each do |achievement|
      if @five_days_ago == achievement.updated_at.strftime("%m月%-d日")
        five_day_achievement << achievement 
      end
      @five_day_achievement = five_day_achievement.count
    end

    six_day = today.ago(6.days)
    month = six_day.month
    day = six_day.day
    @six_days_ago = "#{month}月#{day}日"
    @achievements = Achievement.where(user_id: params[:id])
    six_day_achievement = []
    @achievements.each do |achievement|
      if @six_days_ago == achievement.updated_at.strftime("%m月%-d日")
        six_day_achievement << achievement 
      end
      @six_day_achievement =six_day_achievement.count
    end
  end

  def time_sum
    @achievements = Achievement.where(user_id: params[:id])
    hour_array = []
    minute_array = []
    @achievements.each do |achievement|
      hour_sum = achievement.tweet.end_hour.name.to_i - achievement.tweet.start_hour.name.to_i
      minute_sum = achievement.tweet.end_minute.name.to_i + achievement.tweet.start_minute.name.to_i
      hour_array << hour_sum
      minute_array << minute_sum
    end
    hours_array = hour_array.sum
    m_array = minute_array.sum
    minute_array = m_array / 60
    sum = hours_array + minute_array
    @time_sum = sum.floor
  end

end
