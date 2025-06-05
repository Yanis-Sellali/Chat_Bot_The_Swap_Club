class ChatsController < ApplicationController

  def show
    @chat = Chat.includes(:messages).find(params[:id])
      if Rails.env.development?
    @input_tokens = @chat.messages.sum(:input_tokens)
    @output_tokens = @chat.messages.sum(:output_tokens)
    @context_window = RubyLLM.models.find("gpt-4.1").context_window
  end
    @message = Message.new
  end

  def create
    @jersey = Jersey.create(user: current_user)
    @chat = Chat.create(jersey: @jersey, user: current_user)
    redirect_to chat_path(@chat)
  end
end
