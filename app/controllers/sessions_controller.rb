class SessionsController < ApplicationController

    def new
    end

    def create
      user = User.find_by(email: params[:session][:email])
    
      if user && user.authenticate(params[:session][:password])
        log_in(user)
        flash[:success] = "Vous êtes bien connecté!"
        redirect_to root_url
      else
        render 'new'
        flash.now[:error] = "Il y a un problème avec les informations que vous avez entrées, veuillez réessayer."
    end
  end    
end