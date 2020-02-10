class UsersController < ApplicationController
    before_action :find_user, only: [:index,:show]

    def signup
    end

    def show
    end 
    
    def index
        
    end

    def find_user
        @user = User.find_by(id: params[:id])
    end
end
