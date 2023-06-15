class AssessmentsController < ApplicationController
  def new
    search = params[:technologies]

    if search.present?
      @mentors = User.joins(specialties: [:technology])
                     .where(technologies: { name: search })
                     .where("specialties.skill_level > ?", 3)
                     .where.not(users: { id: current_user.id })
                     .group("users.id")
                     .having("COUNT(DISTINCT technologies.name) >= ?", (search.length.to_f / 2).ceil)
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
