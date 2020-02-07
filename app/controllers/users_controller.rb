class UsersController < ApplicationController
    def signup
    end

    def show
        binding.pry
        @user = User.find_by(id: params[:id])
    end 
end
