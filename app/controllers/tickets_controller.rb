class TicketsController < ApplicationController
    def index
    end

    def new
     @ticket = Ticket.new   
    end

    def create
        current_user.tickets.create(ticket_params)
        redirect_to user_tickets_path(current_user.id)
    end

    def show
        @ticket = Ticket.find_by(id: params[:id])
    end

    private
        def ticket_params
            params.require(:ticket).permit(:description,:content)
        end
end
