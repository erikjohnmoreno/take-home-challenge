class GuestsController < ApplicationController

  def create
    service = Guests::Processor.new(params)

    if service.run_create
      render json: { success: true }
    end

  end

end
