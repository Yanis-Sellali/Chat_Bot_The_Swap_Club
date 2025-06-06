class JerseysController < ApplicationController
def generate_from_chat
  chat = Chat.find(params[:chat_id])
  message = Message.find(params[:image_message_id])

  unless message.image.attached?
    redirect_to chat_path(chat), alert: "Le message n'a pas d'image attachée."
    return
  end

  # ✅ Génère l’URL Cloudinary (même en local si Cloudinary est le storage)
  image_url = message.image.blob.url if message.image.blob.respond_to?(:url)

  Rails.logger.debug "Cloudinary image URL: #{image_url}"

  llm = RubyLLM.chat(model: "gpt-4.1")
  response = llm.ask([
    { type: "text", text: message.content },
    { type: "image_url", image_url: { url: image_url } }
  ])

  data = parse_llm_response(response.content)

@jersey = Jersey.new(
  title: data[:title],
  description: data[:description],
  brand: data[:brand],
  size: data[:size],
  condition: data[:condition],
  user: current_user,
  published: false
)

  @jersey.image.attach(message.image.blob)

  if @jersey.save
    redirect_to edit_jersey_path(@jersey), notice: "Brouillon généré. Modifiez les infos avant de publier."
  else
    redirect_to chat_path(chat), alert: "Impossible de créer l'annonce."
  end
end

  def update
    @jersey = Jersey.find(params[:id])
    if @jersey.update(jersey_params.merge(published: true))
      redirect_to @jersey, notice: "Annonce publiée avec succès."
    else
      render :edit
    end
  end

  def edit
  @jersey = Jersey.find(params[:id])
  end

  private

 def jersey_params
  params.require(:jersey).permit(:name, :year, :team, :image, :description, :brand, :size, :condition, :title)
end

  def parse_llm_response(content)
    {
      title: content[/Titre\s*:\s*(.+)/i, 1],
      description: content[/Description\s*:\s*(.+)/i, 1],
      brand: content[/Marque\s*:\s*(.+)/i, 1],
      size: content[/Taille\s*:\s*(.+)/i, 1],
      condition: content[/État\s*:\s*(.+)/i, 1],
    }
  end
end
