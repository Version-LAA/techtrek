class MentorsController < ApplicationController
  def index
    # This is where we will implement the backend for our search bar if I am not mistaken
  end

  def show
    @mentor = User.find(params[:id])

    @specialties = Specialty.where(user: @mentor).order(skill_level: :desc)
    @education = Education.where(user: @mentor)
    @experiences = Experience.where(user: @mentor)
    unless current_user.nil?
      existing_channel = ChatChannel.where(user1_id: current_user.id, user2_id: @mentor.id).or(ChatChannel.where(user1_id: @mentor.id, user2_id:current_user.id))
      if existing_channel.blank?
        @chat_channel = ChatChannel.create(user1_id: current_user.id, user2_id: @mentor.id)
      else
        @chat_channel = existing_channel[0]
      end
      @message = Message.new(receiver: @mentor, sender: current_user, chat_channel: @chat_channel)
    end
  end

  private

  def channel_params
    params.require(:chat_channel).permit(:name)
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
