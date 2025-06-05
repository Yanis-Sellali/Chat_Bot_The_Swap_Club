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
    puts "Nom: #{@jersey.name}, Année: #{@jersey.year}"
    @jersey.description = RubyLLM.chat.ask("Décris ce jersey de football : #{@jersey.name} #{@jersey.year}").content

    if @jersey.save
      redirect_to jersey_path(@jersey)
    else
      render :new
    end
  end

  private

  def jersey_params
    params.require(:jersey).permit(:name, :year, :team, :image)
  end
end
