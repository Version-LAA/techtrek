class SpecialtiesController < ApplicationController
  def index
    @mentors = User.all
  end
end
