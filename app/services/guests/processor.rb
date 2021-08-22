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

    private

    def guest_formatter
      raise 'Implement me'
    end

    def reservation_formatter
      raise 'Implement me'
    end

  end
end