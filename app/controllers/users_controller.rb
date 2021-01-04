class UsersController < ApplicationController
  before_action :set_user, except: [:home]
  before_action :tweets, only: [:show, :task, :record]
  before_action :set_achievements, only: [:record]
  before_action :time_sum, only: [:record]
  before_action :move_to_home, only: [:home]

  def show
  end

  def home
  end

  def task
    today = Time.current
    month = today.month
    day = today.day
    @today = "#{month}月#{day}日"
  end

  def record
    @week_achievement = { **week_achievement_num(6), **week_achievement_num(5), **week_achievement_num(4), **week_achievement_num(3), **week_achievement_num(2),  **week_achievement_num(1),  **week_achievement_num(0) }
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

  def set_achievements
    @achievements = Achievement.where(user_id: params[:id])
    end

  def week_achievement_num(num)
    today_info = Time.current
    achievement_day_info = today_info.ago(num.days)
    month = achievement_day_info.month
    day = achievement_day_info.day
    month_day = "#{month}月#{day}日"
    achievements = []
    @achievements.each do |achievement|
      if month_day == achievement.updated_at.strftime("%-m月%-d日")
        achievements << achievement
      end
    end
    achievement_count = achievements.count
    @hash = { "#{month_day}": achievement_count }
    return @hash
  end

  def time_sum
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

  def move_to_home
    if user_signed_in?
      redirect_to tweets_path
    end
  end

end
