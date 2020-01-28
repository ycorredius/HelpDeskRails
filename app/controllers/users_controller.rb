class UsersController < ApplicationController
    def signup
    end

    def show
        @user = User.find_by(id: params[:id])
    end 
end
