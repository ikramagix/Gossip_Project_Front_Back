class WelcomeController < ApplicationController
    def greet
        @first_name = params[:first_name]
    end

    def all_gossips
        @gossips = Gossip.all
    end
end