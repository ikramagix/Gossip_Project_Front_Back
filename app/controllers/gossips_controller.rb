class GossipsController < ApplicationController
    def show
    @id = params
    @gossip = Gossip.find(params[:id])
    end
  end