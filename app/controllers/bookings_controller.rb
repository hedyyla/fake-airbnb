class BookingsController < ApplicationController
  def host
    @bookings = Booking.requests_for(current_user)
    @listings = Listing.all

    if params[:filter]
      if params[:filter] == "pending"
        @bookings = @bookings.where(status: "pending")
      end

      if params[:filter] == "upcoming"
        @bookings = @bookings.where("start_date > ?", Date.today).where(status: "confirmed")
      end
    end
  end

  def stats
    @bookings = Booking.requests_for(current_user).where(status: "confirmed")
    @listings = Listing.all

    if params[:filter] == "current_year"
      puts "filter by current year"
      @bookings = @bookings.where("start_date > ?", Date.today.beginning_of_year)
    elsif params[:filter] == "current_month"
      puts "filter by current month"
      @bookings = @bookings.where("start_date > ?", Date.today.beginning_of_month)
    end
  end
end
