class UserPracticasController < ApplicationController
  def sort
    @user_practica = UserPractica.find(params[:id])
    if current_user?(@user_practica.user)
      @user_practica.insert_at(params[:user_practica][:row_order_position].to_i + 1)
    end

    head :ok
  end

  def update_range
    @user_practica = UserPractica.find(params[:id])
    if current_user?(@user_practica.user)
      @user_practica.range = params[:user_practica][:range].to_i
      @user_practica.save
    end

    head :ok
  end

  def update_comment
    @user_practica = UserPractica.find(params[:id])
    if current_user?(@user_practica.user)
      @user_practica.comment = params[:user_practica][:comment]
      @user_practica.save
    end

    head :ok
  end

  def update_aplicable
    @user_practica = UserPractica.find(params[:id])
    if current_user?(@user_practica.user)
      @user_practica.no_aplicable = params[:user_practica][:no_aplicable]
      @user_practica.save
    end

    head :ok
  end

  def update
    @user_practica = UserPractica.find(params[:id])
    @user_practica.update(user_practica_params) if current_user?(@user_practica.user)

    head :ok
  end

  private

  def user_practica_params
    params.require(:user_practica).permit(:effort)
  end
end
