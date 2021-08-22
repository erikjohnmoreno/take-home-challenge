module Guests
  class Processor < Base
      
    def run_create
      if params[:reservation].present?
        # handles payload2
        Guests::BookingParser.new(params).run_parse
      else
        # handles payload1
        Guests::AirbnbParser.new(params).run_parse
      end
    end

    def run_parse
      ActiveRecord::Base.transaction do
        guest = Guest.new(guest_formatter)
        if guest.save
          guest.reservations.create(reservation_formatter)
        end
      end
    end

    private

    def guest_formatter
      raise 'Implement me'
    end

    def reservation_formatter
      raise 'Implement me'
    end

  end
end