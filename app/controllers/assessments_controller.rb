class AssessmentsController < ApplicationController
  def new
    @assessment = Assessment.new(user: current_user)
    @question_bank = Question.all
    @question_bank.each do |ques|
      @assessment_question = AssessmentQuestion.new(question: ques, assessment: @assessment)
      @assessment_question.save
    end
    @user_assessment = AssessmentQuestion.where(assessment_id:@assessment)

  end

  def create
  end

  def show
  end

end
