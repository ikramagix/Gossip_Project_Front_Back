class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
          log_in(@user)
          flash[:success] = "Vous avez bien créé votre compte. Veuillez vous connecter."
          redirect_to new_session_path
        else
        flash[:alert] = "La création du compte a échoué, veuillez réessayer."
          render 'new'
        end
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :city_id)
    end
end