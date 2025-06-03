require "openai"

class QuestionsController < ApplicationController
  def new
  end

  def create
    client = OpenAI::Client.new

    response = client.chat.completions.create(
      model: "gpt-3.5-turbo",
      messages: [
        { role: "user", content: params[:question] }
      ],
      temperature: 0.7
    )

    @question = params[:question]
    @answer = response.choices.first.message.content

    render :new
  end
end
