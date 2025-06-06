class JerseysController < ApplicationController

  def index
    @jerseys = Jersey.with_attached_image.where.not(image: nil)
    # @jerseys = Jersey.with_attached_image
    @jerseys = Jersey.where.not(name: [nil, ""], description: [nil, ""]).with_attached_image
  end

  def show
    @jersey = Jersey.find(params[:id])

  end

  def new
    @jersey = Jersey.new
     @jersey = Jersey.new(description: params[:description])
  end

  def create
    @jersey = Jersey.new(jersey_params)

    @jersey.description = RubyLLM.chat.ask("Décris ce jersey de football : #{@jersey.name} #{@jersey.year}").content
    @jersey.user = current_user
    if @jersey.save
      redirect_to jersey_path(@jersey), notice: "Annonce créée avec succès !"
    else
      render :new
    end
  end

  def auto_create
  jersey = Jersey.create!(
    name: "Maillot IA #{Time.now.to_i}",
    team: "Real Madrid",
    flocking: "Vinicius Jr",
    year: 2022,
    description: "Ce maillot a été généré automatiquement par l'IA.",
    image_url: "https://via.placeholder.com/300x200",
    user: current_user
  )
  redirect_to jerseys_path, notice: "Maillot créé automatiquement !"
end

  private

  def jersey_params
    params.require(:jersey).permit(:name, :year, :team, :image)
  end
end
