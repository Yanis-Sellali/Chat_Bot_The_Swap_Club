class MessagesController < ApplicationController
  def new
  end

  def show
  end

  def create
    @question = params[:question]

    chat = RubyLLM.chat

    response = chat.ask(@question)

    @answer = response.content
  end
end
