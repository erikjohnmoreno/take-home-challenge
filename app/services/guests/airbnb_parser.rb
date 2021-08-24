module Guests
  class AirbnbParser
    
    attr_reader :params

    def initialize params
      @params = params
    end

    def guest
      {
        email: params[:guest][:email],
        first_name: params[:guest][:first_name],
        last_name: params[:guest][:last_name],
        phone_numbers: [params[:guest][:phone]].flatten
      }
    end

    def reservation
      {
        start_date: params[:start_date],
        end_date: params[:end_date],
        nights: params[:nights],
        guests: {
          adults: params[:adults],
          children: params[:children],
          infants: params[:infants]
        },
        status: params[:status],
        currency: params[:currency],
        payout_price: params[:payout_price],
        security_price: params[:security_price],
        total_price: params[:total_price]
      }
    end

  end
end