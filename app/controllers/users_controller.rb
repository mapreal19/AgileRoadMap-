class UsersController < ApplicationController
  before_action :signed_in_user, only: [:dashboard]

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
    @user.ip = request.remote_ip
  	if @user.save
  		sign_in @user
      @user.clone_practicas
      @user.clone_objetivos
      flash[:success] = t(:welcome, url: 'https://www.youtube.com/v/VaCHhjqVKTs').html_safe
  		redirect_to dashboard_url and return
  	else
  		render 'new'
  	end
  end

  def dashboard
    # 3 table join
    @practicas = current_user.user_practicas.includes(:practica)
    @objetivos = current_user.user_objetivos.includes(:objetivo)
  end

  private
  	def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :ambito_trabajo_id, :sector_empresa_id, :miembros_equipo)
    end
end
