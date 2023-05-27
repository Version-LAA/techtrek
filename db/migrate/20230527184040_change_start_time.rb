class ChangeStartTime < ActiveRecord::Migration[7.0]
  def change
    change_column(:consultations, :start_time, :datetime)
  end
end
