class CreateConsultations < ActiveRecord::Migration[7.0]
  def change
    create_table :consultations do |t|
      t.date :start_time
      t.date :end_time
      t.references :specialty, null: false, foreign_key: true
      t.references :mentee, null: false, foreign_key: { to_table: :users }
      t.references :mentor, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
