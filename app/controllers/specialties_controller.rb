class SpecialtiesController < ApplicationController
  def index
    datascience = ['TensorFlow', 'PyTorch','Apache Spark', 'Tableau', 'Matlab', 'python', 'sql']
    careerservices = ['resume review','technical interviews','offer negotiation']
    frontend = ['javascript', 'html', 'css', 'react', 'angular', 'jquery', 'node.js']

    @specialties = Specialty.all
    if params[:query] == 'python'
      @mentors = get_filter('python')
    elsif params[:query] == 'datascience'
      @mentors = get_filter(datascience)
    elsif params[:query] == 'careerservices'
      @mentors = get_filter(careerservices)
    elsif params[:query] == 'javascript'
      @mentors = get_filter('javascript')
    elsif params[:query] == 'frontend'
      @mentors = get_filter(frontend)
    else
      @mentors = User.all
    end
  end

  private

  def get_filter(filter)
    @mentors = User.joins(specialties: [:technology])
                   .where(technologies: { name: filter }).uniq
  end
end
