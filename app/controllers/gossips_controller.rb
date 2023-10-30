class GossipsController < ApplicationController
    def show
    @gossip = Gossip.includes(:user).find(params[:id])
    end
  end