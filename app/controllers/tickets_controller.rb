class TicketsController < ApplicationController
    before_action :find_ticket, only: [:show,:edit,:update,:destroy,:resolved]
    def index
        @resolved = Ticket.resolved
        @not_resolved = Ticket.not_resolved
    end

    def new
     @ticket = Ticket.new   
    end
    
    def create
        @ticket = current_user.tickets.create(ticket_params)
        if @ticket.save
            redirect_to user_tickets_path(current_user.id)
        else
            render :new
        end
    end

    def show
        @responses = @ticket.responses
    end

    def edit
        @ticket
    end

    def update
        if @ticket.update(ticket_params)
            redirect_to ticket_path(@ticket.id)
        else
            render :edit
        end
    end

    def destroy
        if @ticket.destroy
            redirect_to user_tickets_path(current_user.id)
        end
    end
    def find_ticket
        @ticket = Ticket.find_by(id: params[:id])
    end

    def resolved
        @ticket.is_resolved = true 
        @ticket.save
        redirect_to user_tickets_path(current_user.id), notice: "Ticket marked as resolved"
    end
    private
        def ticket_params
            params.require(:ticket).permit(:description,:content,:is_resolved)
        end
end
