class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string  :task_1
      t.text    :detalis_1
      t.integer :start_time_1_id
      t.integer :end_time_1_id
      t.integer :start_minutes_1_id
      t.integer :end_minutes_1_id
      t.string  :task_2
      t.text    :detalis_2
      t.integer :start_time_2_id
      t.integer :end_time_2_id
      t.integer :start_minutes_2_id
      t.integer :end_minutes_2_id
      t.string  :task_3
      t.text    :detalis_3
      t.integer :start_time_3_id
      t.integer :end_time_3_id
      t.integer :start_minutes_3_id
      t.integer :end_minutes_3_id
      t.timestamps
    end
  end
end
