class GossipsController < ApplicationController
    before_action :require_login, only: [:new, :create]

    def show
    @gossip = Gossip.includes(:user).find(params[:id])
    end

    def index
      @gossips = Gossip.all
    end

    def create
      @gossip = Gossip.new(gossip_params)
      @gossip.user = current_user
      if @gossip.save
        flash[:success] = 'Le potin a bien été créé!'
        redirect_to gossips_path #redirige et repart à 0
      else
        flash.now[:alert] = 'Oh non! La création du potin a échoué. Tous les champs de texte sont obligatoires. Le titre doit faire entre 3 et 14 caractères.'
        render :new #redirige mais conserve les infos du @gossip
      end
    end

    def edit 
      @gossip = Gossip.find(params[:id])
    end

    def update
      @gossip = Gossip.find(params[:id])
      if @gossip.update(gossip_params)
        redirect_to @gossip
      else
        render :edit
      end
    end

    def destroy
      @gossip = Gossip.find(params[:id])
      @gossip.destroy
      redirect_to root_path
    end
  
    private

    def require_login
      unless current_user
        flash[:alert] = "Accès refusé. Vous devez vous connecter pour effectuer cette action."
        redirect_to new_session_path
      end
    end
  
    def gossip_params
      params.require(:gossip).permit(:title, :content)
    end
end