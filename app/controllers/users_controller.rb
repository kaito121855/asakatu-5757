class UsersController < ApplicationController
  before_action :set_user
  before_action :tweets, only: [:show, :task, :record]
  before_action :time_sum, only: [:record]

  def show
  end

  def task
    today = Time.current
    month = today.month
    day = today.day
    @today = "#{month}月#{day}日"
  end

  def record
    @today, @today_achievement = week(0)
    @one_days_ago, @one_day_achievement = week(1)
    @two_days_ago, @two_day_achievement = week(2)
    @three_days_ago, @three_day_achievement = week(3)
    @four_days_ago, @four_day_achievement = week(4)
    @five_days_ago, @five_day_achievement = week(5)
    @six_days_ago, @six_day_achievement = week(6)
    @week_achievement = { @six_days_ago => @six_day_achievement, @five_days_ago => @five_day_achievement, @four_days_ago => @four_day_achievement, @three_days_ago => @three_day_achievement, @two_days_ago => @two_day_achievement, @one_days_ago => @one_day_achievement, @today => @today_achievement, }
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

  def week(num)
    today_info = Time.current
    achievement_day_info = today_info.ago(num.days)
    month = achievement_day_info.month
    day = achievement_day_info.day
    @month_day = "#{month}月#{day}日"
    @achievements = Achievement.where(user_id: params[:id])
    achievements = []
    @achievements.each do |achievement|
      if @month_day == achievement.updated_at.strftime("%m月%-d日")
        achievements << achievement
      end
    end
    @achievement_count = achievements.count
    return @month_day, @achievement_count
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
