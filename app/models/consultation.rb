class Consultation < ApplicationRecord
  validates :start_time, :end_time, presence: true
  belongs_to :specialty
  belongs_to :mentee, class_name: "User"
  belongs_to :mentor, class_name: "User"

  default_scope -> { order(:start_time) }  # Our meetings will be ordered by their start_time by default

  def time
    "#{start_time.strftime('%I:%M %p')} - #{end_time.strftime('%I:%M %p')}"
  end
end
