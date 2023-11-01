class CitiesController < ApplicationController
    def show
        @city = City.find(params[:id])
        @users = @city.users
        @gossips = Gossip.where(user_id: @users.pluck(:id))
        #pluck(:id) : extrait les id des users de la variable @users
        #utilise ces id pour filtrer les gossips en utilisant Gossip.where(user_id: ...)
      end
end
