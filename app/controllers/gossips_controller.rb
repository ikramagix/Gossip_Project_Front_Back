class GossipsController < ApplicationController
    def show
    @gossip = Gossip.find(params[:id])
    end
  end