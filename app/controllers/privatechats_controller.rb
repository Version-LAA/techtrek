class PrivatechatsController < ApplicationController

  # To show all message chats a user has
  def index
    @chatrooms = Privatechat.all
  end

  # To show private messages a user has between a usesr
  def show
    @chatroom = Privatechat.find(params[:id])
  end
end
