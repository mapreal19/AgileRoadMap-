class UserPracticasController < ApplicationController

	def sort
		@user_practica = UserPractica.find(params[:id])
		@user_practica.insert_at(params[:user_practica][:row_order_position].to_i + 1)
    # this action will be called via ajax
    render nothing: true
  end

  def update_range
  	@user_practica = UserPractica.find(params[:id])
  	@user_practica.range = params[:user_practica][:range].to_i
  	@user_practica.save
  	render nothing: true
  end

  def update_comment
    @user_practica = UserPractica.find(params[:id])
    @user_practica.comment = params[:user_practica][:comment]
    @user_practica.save
    render nothing: true
  end

  def update_aplicable
    @user_practica = UserPractica.find(params[:id])
    @user_practica.no_aplicable = params[:user_practica][:no_aplicable]
    @user_practica.save
    logger.debug "UserPractica attributes hash: #{@user_practica.attributes.inspect}"
    render nothing: true
  end

end