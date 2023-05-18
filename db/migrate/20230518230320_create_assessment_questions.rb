class CreateAssessmentQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :assessment_questions do |t|
      t.string :answer
      t.references :question, null: false, foreign_key: true
      t.references :assessment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
