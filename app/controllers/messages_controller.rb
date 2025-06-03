class MessagesController < ApplicationController
  def new
  end

  def show
  end

  def create
    @chat = Chat.find(params[:chat_id])
    @message = Message.new(role: "user", content: params[:content], chat: @chat)
    if @message.save
      @llm_chat = RubyLLM.chat
      response = @llm_chat.ask(@message.content)
      Message.create(role: "assistant", content: response.content, chat: @chat)
      redirect_to chat_path(@chat)
    else
      render :new
    end
  end
end
