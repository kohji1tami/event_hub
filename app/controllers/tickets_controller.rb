class TicketsController < ApplicationController
	before_action :authenticate

	def new
		raise ActionController::RoutingError, 'Loggingin user access TicketsController#new'
	end

	def create
		ticket = current_user.tickets.build do |t|
			t.event_id = params[:event_id]
			t.comment = params[:ticket][:comment]
		end
		if ticket.save
			flash[:notice] = 'Join this event.'
			head 201
		else
			render json: { messages: ticket.errors.full_messages }, status: 422
		end
	end
end
