class BookingsController < ApplicationController
  

def index
    # @listings = Listing.all
    @bookings=Booking.order(:id).page params[:page]
  end

def create
	@listing = Listing.find(params[:booking][:listing_id])   
	@booking = current_user.bookings.new(booking_params)
  @booking.listing = @listing

  
	# @booking.update(total_price: (@booking.end_date - @booking.start_date).to_i * @listing.price)
 
	if @booking.save
     #BookingMailer.booking_email(@booking.user ,@listing.user,@booking.id).deliver_now
     BookingJobJob.perform_later(@booking.user ,@listing.user,@booking.id).
		# redirect_to listing_path(@listing)
		 redirect_to booking_path(@booking), notice: "Your reservation has been created..."
	else
    errors = @booking.errors.messages
		render "listings/show"
	end
end

def show
    @booking = Booking.find(params[:id])

 end

 def edit
 		@booking = Booking.find(params[:id])
    @listing = Listing.find(@booking.listing_id)
 end

def update
		@booking = Booking.find(params[:id])
    @listing = Listing.find(@booking.listing_id)
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        flash[:danger] = "Booking is not available on thay dates"
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end


def destroy
  @booking = Booking.find(params[:id])
  @booking.destroy
  flash[:success] = "Booking deleted"
  redirect_to bookings_path
end

def booking_params
	params.require(:booking).permit(:num_guests, :start_date, :end_date, :listing_id)
end

end
