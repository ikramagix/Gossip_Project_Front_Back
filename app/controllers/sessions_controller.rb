class SessionsController < ApplicationController

    def new
    end

    def create
      user = User.find_by(email: params[:session][:email])
    
      if user && user.authenticate(params[:session][:password])
        log_in(user)
        flash[:success] = "Vous êtes bien connecté !"
        redirect_to root_path
      else
        flash[:alert] = "Il y a un problème avec les informations que vous avez entrées, veuillez réessayer."
        render 'new'
    end
  end    

  def destroy 
    log_out
    flash[:alert] = "Vous êtes maintenant déconnecté. A bientôt !"
    redirect_to root_path
  end
end