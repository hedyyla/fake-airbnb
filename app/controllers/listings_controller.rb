class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_listing, only: %i[show]

  def index
    @listings = Listing.all
  end

  def show
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.host = current_user
    if @listing.save
      redirect_to :root
    else
      render :new, status: :unprocessable_ent≥ity
    end
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:name, :details, :location, :max_guests, :price_per_night, photos: [])
  end
end
