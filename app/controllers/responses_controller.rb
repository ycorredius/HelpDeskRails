class ResponsesController < ApplicationController
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

    private
    def response_params
        params.require(:response).permit(:content,:ticket_id)
    end
end
