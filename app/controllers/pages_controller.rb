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
    @result = {}
    UserObjetivo.all.each do |user_objetivo|
      @result[user_objetivo.objetivo_id] ||= []
      @result[user_objetivo.objetivo_id].push user_objetivo.position
    end

    @result.each do |key, array|
      # inject(:+) suma todos los elementos del array. to_f para que la division no sea entera.
      @result[key] = array.inject(:+).to_f / array.size
    end

    # --- Practicas

    @pracs_position = UserPractica.get_prac_position_stats

    # --- Users
    # Ambito Trabajo
    @user_ambitos = User.group(:ambito_trabajo_id).count

    mappings = AmbitoTrabajo.all.pluck(:id, :nombre)
    hash_mappings = {}
    mappings.each do |mapping|
      hash_mappings[mapping[0]] = mapping[1]
    end

    @user_ambitos = Hash[@user_ambitos.map {|k, v| [hash_mappings[k], v] }]

    # Countries
    # http://api.hostip.info/get_json.php?84.126.72.132
    @user_countries = {}
    User.all.each do |user|
      result = JSON.parse(
          open("http://ip-api.com/json/#{user.ip}")
          .read
      )
      country = result["country"]
      @user_countries[country] ||= 0
      @user_countries[country] += 1
    end

  end

end
