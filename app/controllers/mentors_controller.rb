class MentorsController < ApplicationController
  def index
    # This is where we will implement the backend for our search bar if I am not mistaken
  end

  def show
    @channel = ChatChannel.create
    @mentor = User.find(params[:id])
    @message = Message.new(receiver:@mentor)
    @specialties = Specialty.where(user: @mentor).order(skill_level: :desc)
    @education = Education.where(user: @mentor)
    @experiences = Experience.where(user: @mentor)
  end


  private

  def message_params
    params.require(:message).permit(:content)
  end
end
