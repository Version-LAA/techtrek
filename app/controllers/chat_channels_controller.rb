class ChatChannelsController < ApplicationController

  def index
    @channels = ChatChannel.where(user1_id: current_user).or(ChatChannel.where(user2_id: current_user))
  end

  def new
    @chat_channel = ChatChannel.create
    redirect_to chat_channel_path(@chat_channel, receiver_id: params[:receiver_id])
  end

  def create
    @channel = ChatChannel.new(channel_params)
    @message.chat_channel = @channel
    @message = Message.new(message_params)

  end

  def show
    @channel = ChatChannel.find(params[:id])
    @message = Message.new
    @messages = Message.where(chat_channel_id: @channel)


  end

  private

  def channel_params
    params.require(:chat_channel).permit(:name)
  end

  def message_params
    params.require(:message).permit(:content)

  end

end
