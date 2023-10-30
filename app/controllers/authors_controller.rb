class AuthorsController < ApplicationController
    def find_user
        @user = User.find(params[:id])
    end
end