class MessagesController < ApplicationController
  def new
    @message = Message.new(sender_id: current_user, receiver_id: params[:id])
  end

  def create
    @message = Message.new(message_params)
    @message.receiver_id = params[:mentor_id]
    @message.sender_id = current_user.id
    @message.save
    @user = params[:id]
    if @message.save
      redirect_to mentor_path(params[:mentor_id])
    else
      redirect_to root_path, status: :unprocessable_entity
    end
  end

  def show
    @message = Message.new
    @messages = Message.where("(sender_id = :user1_id AND receiver_id = :user2_id) OR (sender_id = :user2_id AND receiver_id = :user1_id)",
                              user1_id: params[:id], user2_id: params[:mentor_id])
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
