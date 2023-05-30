class ChatChannelsController < ApplicationController

  def index
    @channel = ChatChannel.all
  end

  def create
    @channel = ChatChannel.new(channel_params)
    @message.chat_channel = @channel
    @message = Message.new(message_params)
    raise

  end

  def show
    @channel = ChatChannel.find(params[:id])
  end

  private

  def channel_params
    params.require(:chat_channel).permit(:name)
  end

  def message_params
    params.require(:message).permit(:content)
  end

end
