module Guests
  class BookingParser

    attr_reader :params

    def initialize params
      @params = params[:reservation]
    end

    def guest
      {
        email: params[:guest_email],
        first_name: params[:guest_first_name],
        last_name: params[:guest_last_name],
        phone_numbers: params[:guest_phone_numbers]
      }
    end

    def reservation
      {
        start_date: params[:start_date],
        end_date: params[:end_date],
        nights: params[:nights],
        guests: {
          adults: params[:guest_details][:number_of_adults],
          children: params[:guest_details][:number_of_children],
          infants: params[:guest_details][:number_of_infants]
        },
        status: params[:status_type],
        currency: params[:host_currency],
        payout_price: params[:expected_payout_amount],
        security_price: params[:listing_security_price_accurate],
        total_price: params[:total_paid_amount_accurate]
      }
    end

  end
end