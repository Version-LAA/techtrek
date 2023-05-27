class ChangeEndTime < ActiveRecord::Migration[7.0]
  def change
    change_column(:consultations, :end_time, :datetime)
  end
end
