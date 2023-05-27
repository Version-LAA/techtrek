class SpecialtiesController < ApplicationController
  def index
    datascience = ['TensorFlow', 'PyTorch','Apache Spark', 'Tableau', 'Matlab', 'python', 'sql']
    careerservices = ['resume review','technical interviews','offer negotiation']

    @specialties = Specialty.all
    if params[:query] == 'python'
      @mentors = set_filter('python')
    elsif params[:query] == 'datascience'
      @mentors = set_filter(datascience)
    elsif params[:query] == 'career services'
      @mentors = @mentors = set_filter(careerservices)
    elsif params[:query] == 'javascript'
      @mentors = @mentors = set_filter('javascript')
    else
      @mentors = User.all
    end
  end

  private

  def set_filter(filter)
    @mentors = User.joins(specialties: [:technology])
                   .where(technologies: { name: filter })
  end
end
