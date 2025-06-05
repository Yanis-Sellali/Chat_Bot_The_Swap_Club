class ChatsController < ApplicationController

  ANNONCE_PROMPT = "Tu es un expert en maillots de football vintage. Ton rôle est d’aider un utilisateur à rédiger une annonce attractive et complète pour un site d’échange de maillots appelé The Swap Club.

  À partir d’un message utilisateur (texte et/ou image), rédige :
  1. Un titre accrocheur(concis, précis, format : Club/Année/Spécificité)
  2. Une description complète (contexte historique, design, sponsor, joueur célèbre, rareté)
  3. Une section Caractéristiques avec :
     - Taille (si fournie)
     - État (si précisé ou estimer)
     - Époque (année, décennie)
     - Marque et sponsor
     - Flocage (s'il y a un nom/numéro)
     - Authenticité (original, réédition, contrefaçon probable)

  Rédige avec style, pour un public de passionnés de foot et de collectionneurs de maillots. Sois vendeur mais honnête. Ne dépasse pas 200 mots"

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

  def generate_ad_from_image
  chat = Chat.find(params[:id])
  image_message = Message.find(params[:image_message_id])

  if image_message.image.attached?
    new_message = Message.create!(
      chat: chat,
      role: "user",
      content: "Peux-tu me rédiger une annonce à partir de cette image ?",
      image: image_message.image.blob
    )

    @llm = RubyLLM.chat(model: "gpt-4.1").with_instructions(ANNONCE_PROMPT)
    image_url = new_message.image.url

    response = @llm.ask([
      { type: "text", text: new_message.content },
      { type: "image_url", image_url: { url: image_url } }
    ])

    Message.create!(
      chat: chat,
      role: "assistant",
      content: response.content
    )

    redirect_to chat_path(chat)
  else
    flash[:alert] = "Aucune image attachée."
    redirect_to chat_path(chat)
  end
end
end
