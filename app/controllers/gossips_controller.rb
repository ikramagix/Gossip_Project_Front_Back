class GossipsController < ApplicationController
    def show
    @gossip = Gossip.includes(:user).find(params[:id])
    end

    def index
      @gossips = Gossip.all
    end

    def create
      @gossip = Gossip.new(gossip_params)
      @gossip.user = User.find(201)
  
      if @gossip.save
        redirect_to gossips_path, notice: 'Le potin a bien été créé!'
      else
        flash.now[:alert] = 'Erreur: Tous les champs de texte sont obligatoires, veillez également à ce que le titre fasse entre 3 à 14 caractères au maximum.'
        render 'new'
      end
    end
  
    private
  
    def gossip_params
      params.require(:gossip).permit(:title, :content)
    end
end