module Guests
  class Processor < Base
      
    def run_create
      formatter = if params[:reservation].present?
        # handles payload2
        Guests::BookingParser.new(params)
      else
        # handles payload1
        Guests::AirbnbParser.new(params)
      end
      run_parse(formatter.guest, formatter.reservation)
    end

    def run_parse guest_formatter, reservation_formatter
      begin
        ActiveRecord::Base.transaction do
          guest = Guest.find_or_initialize_by(email: guest_formatter[:email])
          guest.assign_attributes(guest_formatter)
          if guest.save!
            guest.reservations.create(reservation_formatter)
          end
        end
      rescue => error
        raise error
      end
    end

  end
end