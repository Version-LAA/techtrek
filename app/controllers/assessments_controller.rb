class AssessmentsController < ApplicationController
  def new
    search = params[:technologies]

    if search.present?
      @mentors = User.joins(specialties: [:technology])
                     .where(technologies: { name: search })
                     .where("specialties.skill_level > ?", 3)
                     .distinct


    else
      @mentors = User.all
    end

  end

  def create
  end

  def show
  end

end
