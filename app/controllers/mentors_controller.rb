class MentorsController < ApplicationController
  def index
  end

  def show
    @mentor = User.find(params[:id])
    @specialties = Specialty.where(user: @mentor)
  end
end
