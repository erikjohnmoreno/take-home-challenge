class ReservationsController < ApplicationController

  def create
    service = Guests::Processor.new(params)
    render json: service.run_create
  end

end
