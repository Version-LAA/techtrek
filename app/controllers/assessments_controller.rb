class AssessmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new]
  def new
    search = params[:technologies]

    if current_user
      if search.present?
        @mentors = User.joins(specialties: [:technology])
                      .where(technologies: { name: search })
                      .where("specialties.skill_level > ?", 3)
                      .where.not(users: { id: current_user.id })
                      .distinct


      else
        @mentors = User.all
      end
    else
      @mentors = User.joins(specialties: [:technology])
                      .where(technologies: { name: search })
                      .where("specialties.skill_level > ?", 3)
                      .distinct
    end

  end

  def create
  end

  def show
  end

end
