class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string  :task,            null: false
      t.text    :detalis
      t.integer :start_hour_id,   null: false
      t.integer :start_minute_id, null: false
      t.integer :end_hour_id,     null: false
      t.integer :end_minute_id,   null: false
      t.integer :user_id,         foreign_key: true
      t.timestamps
    end
  end
end
