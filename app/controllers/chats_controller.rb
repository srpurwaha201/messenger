class ChatsController < ApplicationController
  def show
    chat = Chatroom.find(params[:id])
    @chatTitle = chat.name
    @messages = chat.get_Messages
    @message = Message.new
  end
end
