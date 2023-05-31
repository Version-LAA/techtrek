class MentorsController < ApplicationController
  def index
    # This is where we will implement the backend for our search bar if I am not mistaken
  end

  def show
    @channel = ChatChannel.new
    @mentor = User.find(params[:id])
    @specialties = Specialty.where(user: @mentor).order(skill_level: :desc)
    @education = Education.where(user: @mentor)
    @experiences = Experience.where(user: @mentor)
  end



  private

  def channel_params
    params.require(:chat_channel).permit(:name)
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
