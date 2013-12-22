class PracticasController < ApplicationController
  def index
  	@practicas = Practica.all
  end

  def show
  	@practica = Practica.find_by(position: params[:id])
  end
end
