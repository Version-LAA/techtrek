class AssessmentsController < ApplicationController
  def new
    search = params[:technologies]

    if search.present?
      sql_subquery = <<~SQL
        technologies.name ILIKE :search
      SQL
      @mentors = User.joins(specialties: [:technology])
                     .where(technologies: { name: search })
                     .where("specialties.skill_level > ?", 3)
                     .uniq
    else
      @mentors = User.all
    end

  end

  def create
  end

  def show
  end

end
