class MessagesController < ApplicationController
  def new
    @message = Message.new(sender_id: current_user, receiver_id: params[:id])
  end

  def create
    @message = Message.new(message_params)
    @message.receiver_id = params[:mentor_id]
    @message.sender_id = current_user.id
    @message.save
    raise
    if @message.save
      redirect_to mentor_message_path(params[:mentor_id])
    else
      redirect_to root_path, status: :unprocessable_entity
    end
    #@message = Message.new(sender_id: current_user, receiver_id: params[:id])


  end

  def show
    @messages = Message.where(sender_id: current_user).or(Message.where(receiver_id: current_user))
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
