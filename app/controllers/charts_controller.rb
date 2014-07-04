class ChartsController < ApplicationController
  def user_countries
    render json: User.get_countries_stats
  end
end