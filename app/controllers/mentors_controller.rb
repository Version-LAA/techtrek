class MentorsController < ApplicationController
  def index
  end

  def show
    @mentor = User.find(params[:id])
    @specialties = Specialty.where(user: @mentor)
    @education = Education.where(user: @mentor)
    @experiences = Experience.where(user: @mentor)
  end
end
