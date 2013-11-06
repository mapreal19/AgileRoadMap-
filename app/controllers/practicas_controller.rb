class PracticasController < ApplicationController
  def index
  	@practicas = Practica.all
  end

  def show
  end
end
