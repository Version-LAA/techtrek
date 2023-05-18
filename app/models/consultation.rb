class Consultation < ApplicationRecord
  belongs_to :specialty
  belongs_to :user
end
