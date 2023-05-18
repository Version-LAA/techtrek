class CreateUserSpokenLanguages < ActiveRecord::Migration[7.0]
  def change
    create_table :user_spoken_languages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :spoken_language, null: false, foreign_key: true

      t.timestamps
    end
  end
end
