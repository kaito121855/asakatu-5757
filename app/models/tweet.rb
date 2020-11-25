class Tweet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :start_hour

  validates :task_1, presence: true
  with_options numericality: { other_than: 1, message: "は「---」以外のものを選択してください"}  do
    validates :start_time_1_id
    validates :end_time_1_id
    validates :start_minutes_1_id
    validates :end_minutes_1_id
  end

  include CommonModule
end
