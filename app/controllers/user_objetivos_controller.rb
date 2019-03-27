class UserObjetivosController < ApplicationController
  def sort
    @user_objetivo = UserObjetivo.find(params[:id])
    if current_user?(@user_objetivo.user)
      @user_objetivo.insert_at(params[:user_objetivo][:row_order_position].to_i + 1)
    end

    head :ok
  end

  def update_aplicable
    @user_objetivo = UserObjetivo.find(params[:id])
    if current_user?(@user_objetivo.user)
      @user_objetivo.no_interesa = params[:user_objetivo][:no_interesa]
      @user_objetivo.save
      logger.debug "UserObjetivo attributes hash: #{@user_objetivo.attributes.inspect}"
    end

    head :ok
  end

  def update
    @user_objetivo = UserObjetivo.find(params[:id])
    @user_objetivo.update(user_objetivo_params) if current_user?(@user_objetivo.user)

    head :ok
  end

  private

  def user_objetivo_params
    params.require(:user_objetivo).permit(:comment, :no_interesa)
  end
end
