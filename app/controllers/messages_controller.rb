class MessagesController < ApplicationController

  def new
    # need sender id and reciever id

  end

  def show
    @messages = Message.find(params[:id])
  end
end
