# encoding: utf-8

class PasswordResetsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: password_reset_params[:email])
  	user.send_password_reset if user
  	redirect_to root_url, :notice => "Email envidado con instrucciones para restablecer la contraseña"
	end

	private
  	def password_reset_params
      params.permit(:email)
    end

end
