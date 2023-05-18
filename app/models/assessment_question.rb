class AssessmentQuestion < ApplicationRecord
  belongs_to :question
  belongs_to :assessment
end
