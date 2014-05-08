class UserObjetivosController < ApplicationController

  def sort
    @user_objetivo = UserObjetivo.find(params[:id])
    if current_user?(@user_objetivo.user)
      @user_objetivo.insert_at(params[:user_objetivo][:row_order_position].to_i + 1)
    end
    # this action will be called via ajax
    render nothing: true
  end

end