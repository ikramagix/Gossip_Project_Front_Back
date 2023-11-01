class GossipsController < ApplicationController
    def show
    @gossip = Gossip.includes(:user).find(params[:id])
    end

    def index
      @gossips = Gossip.all
    end

    def create
      @gossip = Gossip.new(gossip_params)
      @gossip.user = User.find(207)
  
      if @gossip.save
        flash[:success] = 'Le potin a bien été créé!'
        redirect_to gossips_path #redirige et repart à 0
      else
        flash.now[:alert] = 'Oh non! La création du potin a échoué. Tous les champs de texte sont obligatoires. Le titre doit être entre 3 et 14 caractères maximum.'
        render 'new' #redirige mais conserve les infos du @gossip
      end
    end
  
    private
  
    def gossip_params
      params.require(:gossip).permit(:title, :content)
    end
end