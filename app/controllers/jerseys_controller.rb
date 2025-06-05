class JerseysController < ApplicationController

  def index
    @jerseys = Jersey.all
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

    if @jersey.save
      redirect_to @jersey
    else
      render :new
    end
  end

  def new
    @jersey = Jersey.new(description: params[:description])
  end

  def create
    @jersey = Jersey.new(jersey_params)
    if @jersey.save
      redirect_to @jersey, notice: "Annonce créée avec succès !"
    else
      render :new
    end
  end

  def show
    @jersey = Jersey.find(params[:id])
  end

  private

  def jersey_params
    params.require(:jersey).permit(:title, :description, :image)
  end

  def jersey_params
    params.require(:jersey).permit(:name, :year, :image_url)
  end
end
