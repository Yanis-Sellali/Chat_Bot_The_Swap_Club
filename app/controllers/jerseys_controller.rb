class JerseysController < ApplicationController

  def index
    @jerseys = Jersey.all
  end

  def show
    @jersey = Jersey.find(params[:id])
  end

  def new
    @jersey = Jersey.new
  end

  def create
    @jersey = Jersey.new(jersey_params)
    @jersey.description = RubyLLM.chat.ask("Décris ce jersey de football : #{@jersey.nom} #{@jersey.annee}").content

    if @jersey.save
      redirect_to @jersey
    else
      render :new
    end
  end

  private

  def jersey_params
    params.require(:jersey).permit(:name, :year, :image)
  end
end
