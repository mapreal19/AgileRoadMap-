class UserPracticasController < ApplicationController

	def sort
		@user_practica = UserPractica.find(params[:id])
    @user_practica.insert_at(params[:user_practica][:row_order_position].to_i + 1)
    # this action will be called via ajax
    render nothing: true
  end

end