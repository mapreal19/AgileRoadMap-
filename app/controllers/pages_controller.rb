require 'open-uri'

class PagesController < ApplicationController
  #before_action :authenticate, only: :stats

  def home
  end

  def about_us
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

    @pracs_position = UserPractica.get_prac_position_stats
    
    @margen_stats = UserPractica.get_margen_stats
    # --- Users

    # Ambito Trabajo
    @user_ambitos = User.get_ambito_trabajo_stats

    @user_sectores = User.get_sector_empresa_stats

    #@user_countries = User.get_countries_stats

  end

  protected

  def authenticate
    if Rails.env.production?
      authenticate_or_request_with_http_basic('Administration') do |username, password|
        # Password generado en http://www.md5.cz/
        md5_of_password = Digest::MD5.hexdigest(password)
        username == 'admin' && md5_of_password == '586f25ceb19ab7da57517487621dde79'
      end
    end
  end

end
