class MentorsController < ApplicationController
  def index
    # @mentors = Mentor.all
    # This line seems to break my code so im commenting it out for now, this is what they did in the lecture though :think:
    if params[:query].present?
      sql_subquery = <<~SQL
        mentors.specialty @@ :query
        OR mentors.location @@ :query
        OR directors.first_name @@ :query
        OR directors.last_name @@ :query
      SQL
      @mentors = @mentors.where(sql_subquery, query: "%#{params[:query]}%")
    end
  end

  def show
    @mentor = User.find(params[:id])
    @specialties = Specialty.where(user: @mentor)
    @education = Education.where(user: @mentor)
    @experiences = Experience.where(user: @mentor)
  end
end
