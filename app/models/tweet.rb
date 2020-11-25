class Tweet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :start_hour
  belongs_to :start_minute
  belongs_to :end_hour

  validates :task_1, presence: true
  with_options numericality: { other_than: 1, message: "は「---」以外のものを選択してください"}  do
    validates :start_hour_id
    validates :start_minute_id
    validates :end_hour_id
    validates :end_minutes_1_id
  end

  include CommonModule
end
