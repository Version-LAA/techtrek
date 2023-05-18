class CreateSpecialties < ActiveRecord::Migration[7.0]
  def change
    create_table :specialties do |t|
      t.integer :skill_level
      t.integer :hourly_rate
      t.references :technology, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
