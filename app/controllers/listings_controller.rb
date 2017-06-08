class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy] 




  # GET /listings
  # GET /listings.json
  def index
    # @listings = Listing.all
    @listings=Listing.order(:id)
    # @listings=@listings.city(params[:city]) if params[:city].present?
  end

  def search
    if params[:search]
      @listings = Listing.search(params[:search]).order("created_at DESC")
    else
      @listings = Listing.all.order("created_at DESC")
    end

    render 'users/home'
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
    @booking = @listing.bookings.new
  end

  # GET /listings/new
  def new
    @listing = Listing.new
    # allowed?(action: "new", user: current_user)
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  # POST /listings.json
  def create
    # @listing = Listing.new(listing_params)
    @listing = current_user.listings.new(listing_params)
    # @listing.update(photos: listings_params[:photos])
    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def userlisting
    @listings = current_user.listings
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    def check_owner
      unless @listing.user_id == current_user.id
        redirect_to listings_path, notice: "You are not allowed to access that page."
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:address1, :address2, :postal_code, :state, :country, :price, :room_type, :description, :availability, :bedroom, :bathroom, :max_num_guests, {photos:[]})
    end

    def filtering_params(params)
      # params.slice(:city)
      params(:city)
    end
end
