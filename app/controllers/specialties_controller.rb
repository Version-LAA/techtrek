class SpecialtiesController < ApplicationController
  def index
    datascience = ['TensorFlow', 'PyTorch','Apache Spark', 'Tableau', 'Matlab', 'python', 'sql']
    careerservices = ['resume review','technical interviews','offer negotiation']
    frontend = ['javascript', 'html', 'css', 'react', 'angular', 'jquery', 'node.js']

    @specialties = Specialty.all
    if params[:query] == 'python'
      @mentors = get_filter('python')
      @statement = display_statement[0]
    elsif params[:query] == 'datascience'
      @mentors = get_filter(datascience)
      @statement = display_statement[2]
    elsif params[:query] == 'careerservices'
      @mentors = get_filter(careerservices)
      @statement = display_statement[3]
    elsif params[:query] == 'javascript'
      @mentors = get_filter('javascript')
      @statement = display_statement[1]
    elsif params[:query] == 'frontend'
      @mentors = get_filter(frontend)
      @statement = display_statement[4]
    else
      @mentors = User.all
      @statement = display_statement[5]
    end
  end

  private

  def get_filter(filter)
    @mentors = User.joins(specialties: [:technology])
                   .where(technologies: { name: filter }).uniq
  end

  def display_statement
    statement = [
      'This is a test python statement',
      'this is a test js statement',
      'this is a test datascience statement',
      'career services',
      'frontend',
      'default statement'
    ]
  end
end
