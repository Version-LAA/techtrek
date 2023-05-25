class MentorsController < ApplicationController
  def index
    # This is where we will implement the backend for our search bar if I am not mistaken
  end

  def show
    @mentor = User.find(params[:id])
    @specialties = Specialty.where(user: @mentor)
    @education = Education.where(user: @mentor)
    @experiences = Experience.where(user: @mentor)
  end
end
