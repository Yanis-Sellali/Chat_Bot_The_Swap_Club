class MessagesController < ApplicationController
  SYSTEM_PROMPT = "You are an experienced football expert jersey maker and fan of football, specialised in jersey creation.
  I am a user of a web application named Swap Club, looking for vintage and recent football jerseys. I want to know the jersey characteristics before exchanging it with other users.
  Guide us to describe the story of the jersey, its characteristics (color, flocking, style, company), who made it, who wore it. Provide all the relevant information to help us understand the full story behind the jersey.
  You answer will be in 15 lines "

  def new
  end

  def show
  end

  def create
    @chat = Chat.find(params[:chat_id])
    @message = Message.new(role: "user", content: params[:content], chat: @chat)
    if @message.save
      chat = RubyLLM.chat(model: "gpt-4.1")
      @llm_chat = chat.with_instructions(SYSTEM_PROMPT)
      response = @llm_chat.ask(@message.content)
      Message.create(role: "assistant", content: response.content, chat: @chat)
      redirect_to chat_path(@chat)
    else
      render :new
    end
  end
end
