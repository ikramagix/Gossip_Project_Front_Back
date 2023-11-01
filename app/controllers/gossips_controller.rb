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
        flash[:notice] = 'Le potin a bien été créé!'
        redirect_to gossips_path
      else
        flash.now[:alert] = 'Erreur : la création du potin a échoué. Tous les champs de texte sont obligatoires. Le titre doit être entre 3 et 14 caractères maximum.'
        render 'new'
      end
    end
  
    private
  
    def gossip_params
      params.require(:gossip).permit(:title, :content)
    end
end