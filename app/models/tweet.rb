class Tweet < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :achievements, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :start_hour
  belongs_to :start_minute
  belongs_to :end_hour
  belongs_to :end_minute

  validates :task, presence: true
  validates :category_id, numericality: { other_than: 1, message: 'は「---」以外のものを選択してください' }
  with_options numericality: { other_than: 1, message: 'は「時」以外のものを選択してください' } do
    validates :start_hour_id
    validates :end_hour_id
  end

  with_options numericality: { other_than: 1, message: 'は「分」以外のものを選択してください' } do
    validates :start_minute_id
    validates :end_minute_id
  end

  def already_achieved?(tweet)
    achievements.exists?(tweet_id: tweet.id)
  end

  def self.search(search)
    if search != ""
      Tweet.where('task LIKE(?)', "%#{search}%")
    else
      Tweet.includes(:user).order('tweets.created_at DESC')
    end
  end
end
