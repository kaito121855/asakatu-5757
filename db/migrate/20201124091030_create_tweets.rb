class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string  :task,             null: false
      t.text    :detalis
      t.integer :start_hour_id,    null: false
      t.integer :start_minutes_id, null: false
      t.integer :end_hour_id,      null: false
      t.integer :end_minutes_id,   null: false
      t.timestamps
    end
  end
end
