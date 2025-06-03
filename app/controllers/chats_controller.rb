class ChatsController < ApplicationController

  def show
    @chat = Chat.find(params[:id])
    @message = Message.new
  end

  def create
    @jersey = Jersey.create(user: current_user)
    @chat = Chat.create(jersey: @jersey, user: current_user)
    redirect_to chat_path(@chat)
  end
end
