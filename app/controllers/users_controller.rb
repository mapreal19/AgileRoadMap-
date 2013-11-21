class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		sign_in @user
      clone_practicas(@user)
      flash[:success] = t(:welcome)
  		redirect_to root_path and return
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

    def clone_practicas(user)
      all_practicas = Practica.all
      
      all_practicas.each do |practica|
        user.user_practicas.build(practica_id: practica.id, name: practica.name,
          agile_method: practica.agile_method, position: practica.position).save
      end
    end

end
