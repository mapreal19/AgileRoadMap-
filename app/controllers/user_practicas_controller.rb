class UserPracticasController < ApplicationController

	def sort
		@user_practica = UserPractica.find(params[:id])

    # values via a hash
    #@user_practica.position = params[:user_practica][:position]
    @user_practica.insert_at(params[:user_practica][:row_order_position].to_i + 1)
    #@user_practica.update_attribute :row_order_position, params[:user_practica][:row_order_position]
    #@user_practica.save


    # this action will be called via ajax
    render nothing: true
  end

end