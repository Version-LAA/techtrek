class CreateSpokenLanguages < ActiveRecord::Migration[7.0]
  def change
    create_table :spoken_languages do |t|
      t.string :name

      t.timestamps
    end
  end
end
