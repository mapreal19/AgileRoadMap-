require 'open-uri'

class PagesController < ApplicationController
  def home; end

  def about_us; end

  def agile_map_definition; end

  def what_is_agile_map; end

  def agile_map_pasos; end

  def agile_team; end

  def stats
    @objetivos_position = UserObjetivo.get_position_stats
    @pracs_position = UserPractica.get_prac_position_stats
    @margen_stats = UserPractica.get_margen_stats
    @user_ambitos = User.get_ambito_trabajo_stats
    @user_sectores = User.get_sector_empresa_stats
  end
end
