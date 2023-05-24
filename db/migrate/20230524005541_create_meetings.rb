class CreateMeetings < ActiveRecord::Migration[7.0]
  def change
    create_table :meetings do |t|
      t.string :name
      t.datetime :start_time, presence:true
      t.datetime :end_time, presence:true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
