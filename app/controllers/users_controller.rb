class UsersController < ApplicationController
  before_action :signed_in_user, only: [:dashboard]

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		sign_in @user
      @user.clone_practicas
      flash[:success] = t(:welcome)
  		redirect_to dashboard_url and return
  	else
  		render 'new'
  	end
  end

  def dashboard
    @practicas = current_user.user_practicas
  end

  private
  	def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
