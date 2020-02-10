class ResponsesController < ApplicationController
    before_action :find_response, only: [:edit,:update,:destroy]

    def new
       @ticket = Ticket.find_by(id: params[:ticket_id]) 
       @response = @ticket.responses.build
    end

    def create
        @ticket = Ticket.find_by(id: params[:ticket_id]) 
        @response = current_user.responses.build(response_params)
        if @response.save
            redirect_to ticket_path(@ticket)
        else
            render :new
        end
    end
    
    def find_response
        @response = Response.find_by(id: params[:id])
    end
    def show
        
    end
    def edit
        @ticket = Ticket.find_by(id: params[:ticket_id]) 
        @response = Response.find_by(id: params[:id])
    end

    def update
        if @response.update(response_params)
            redirect_to ticket_path(@response.ticket_id)
        else
            ale
            render :edit
        end
    end
    
    def destroy
        if @response.destroy
            redirect_to ticket_path(params[:ticket_id])
        end
    end

    
    private
    def response_params
        params.require(:response).permit(:content,:ticket_id)
    end
end
