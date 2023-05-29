class CreatePrivatechats < ActiveRecord::Migration[7.0]
  def change
    create_table :privatechats do |t|
      t.string :name

      t.timestamps
    end
  end
end
