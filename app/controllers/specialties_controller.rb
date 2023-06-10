class SpecialtiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    datascience = ['TensorFlow', 'PyTorch','Apache Spark', 'Tableau', 'Matlab', 'python', 'sql']
    careerservices = ['resume review','technical interviews','offer negotiation']
    frontend = ['javascript', 'html', 'css', 'react', 'angular', 'jquery', 'node.js']

    # line 9 - 23 to be refactored. Statement complicates things. We shouldnt't specify these words.
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
      # fix
      if params[:query].present?
        sql_subquery = <<~SQL
          users.first_name ILIKE :query
          OR users.last_name ILIKE :query
          OR users.title ILIKE :query
          OR users.about ILIKE :query
          OR technologies.name ILIKE :query
        SQL
        @mentors = @mentors.joins(specialties: [:technology]).where(sql_subquery, query: "%#{params[:query]}%").uniq
      end
    end
  end

  private

  def get_filter(filter)
    @mentors = User.joins(specialties: [:technology])
                   .where(technologies: { name: filter }).uniq
  end

  def display_statement
    statement = [
      'A Python mentor can offer valuable insights into coding best practices, help you troubleshoot errors, and introduce you to industry-relevant
      libraries and frameworks, empowering you to become a skilled and proficient Python developer.',
      'Are you ready to embark on an exciting coding journey? Look no further than Javascript!
      Whether you are a seasoned programmer or just starting out,Javascript is the ultimate language to empower you and have mentor guide you',
      'Having a mentor teaching data science can greatly accelerate your learning by providing personalized guidance, sharing their practical experience,
      and helping you navigate the complexities of data analysis, machine learning, and statistical modeling. ',
      'Career services with a mentor can be particularly valuable as they offer personalized guidance, wisdom, and industry insights tailored to an individual
      specific career aspirations. A mentor in career services can provide invaluable advice, help navigate challenges, and facilitate networking
      opportunities, ultimately empowering individuals to make informed career decisions and achieve their professional goals.',
      'Frontend development is of utmost importance as it directly impacts the user experience, ensuring a visually appealing and intuitive interface that enhances user engagement and satisfaction.
      A well-designed frontend enables seamless navigation, responsiveness across devices, and efficient interaction, ultimately contributing to the success and adoption of a web or mobile application.',
      'Unlock your full potential and fast-track your success by finding a mentor who will provide invaluable guidance and support on your journey.'
    ]
  end
end
