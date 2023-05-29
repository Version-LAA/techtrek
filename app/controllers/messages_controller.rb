class MessagesController < ApplicationController
  def new
    @message = Message.new(sender_id: current_user, receiver_id: params[:id])
  end

  def create
    @message = Message.new(sender_id: current_user, receiver_id: params[:id])

  end

  def show
    @messages = Message.where(sender_id: current_user).or(Message.where(receiver_id: current_user))
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
