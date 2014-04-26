require 'open-uri'

class PagesController < ApplicationController
  def home
  end

  def about_us
  end

  def agile_map
  end

  def contact
  end

  def agile_map_definition
  end

  def what_is_agile_map
  end

  def agile_map_pasos
  end

  def agile_team
  end

  def stats

    @objetivos_position = UserObjetivo.get_position_stats

    # --- Practicas

    #@pracs_position = UserPractica.get_prac_position_stats

    # --- Users

    # Ambito Trabajo
    #@user_ambitos = User.get_ambito_trabajo_stats

    #@user_countries = User.get_countries_stats

  end

end
