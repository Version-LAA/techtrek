class Consultation < ApplicationRecord
  belongs_to :specialty
  belongs_to :mentee, class_name: "User"
  belongs_to :mentor, class_name: "User"
end
