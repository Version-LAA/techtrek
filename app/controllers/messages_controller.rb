class MessagesController < ApplicationController
  def new
    @message = Message.new(sender_id: current_user, receiver_id: params[:id])
  end

  def create
    @message = Message.new(message_params)
    @chat_channel = ChatChannel.find(params[:chat_channel_id])
    receiver_id = @chat_channel.user1 == current_user ? @chat_channel.user2.id : @chat_channel.user1.id
    @message.receiver_id = receiver_id
    @message.sender_id = current_user.id
    @message.chat_channel = @chat_channel
    @chat_channel.save
    @message.save
    @user = params[:id]
    @message.save

    if params[:message][:redirect] == "true"
      redirect_to chat_channel_path(@chat_channel, receiver_id: receiver_id)
    else
      ChatroomChannel.broadcast_to(
        @chat_channel,
        message: render_to_string(partial: "chat_channels/messages", locals: { message: @message }),
        sender_id: @message.sender_id
      )
      head :ok
    end

  end

  def show
    @message = Message.new
    @messages = Message.where("(sender_id = :user1_id AND receiver_id = :user2_id) OR (sender_id = :user2_id AND receiver_id = :user1_id)",
                              user1_id: params[:id], user2_id: params[:mentor_id])
  end

  private

  def message_params
    params.require(:message).permit(:content) #.permit(:content, chat_channel_attributes: [:name])
  end

  def chat_params
    params.require(:chat_channel).permit(:name)
  end



end
