class ConsultationsController < ApplicationController
  before_action :set_specialty, only: %i[new create]

  def new
    @consultation = Consultation.new
  end

  def create
    #create
    @consultation = Consultation.new(consultation_params)
    @consultation.specialty = @specialty
    @consultation.mentor = @specialty.user
    @consultation.mentee = current_user
    if @consultation.save
      redirect_to mentor_path(@specialty.user)
    else
      redirect_to new_specialty_consultation_path(@specialty)
    end
  end

  private

  def consultation_params
    params.require(:consultation).permit(:start_time, :end_time)
  end

  def set_specialty
    @specialty = Specialty.find(params[:specialty_id])
  end
end
