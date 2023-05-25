class SpecialtiesController < ApplicationController
  def index
    @mentors = User.all
  end

  def javascript

  end

  def cyber_security
  end

  def python
  end

  def resume_review
  end

  def salary_review
  end
end
