class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  validate :check_overlapping_dates
  validate :check_max_num_guests
  #validate num_guests is not negative
  #validate start__date should be after today
   paginates_per 5


   def check_overlapping_dates
   	#compare new booking with existing booking
   	
   	self.listing.bookings.each do |old_booking|
   		if overlap?(self, old_booking)
   			
				return self.errors.add(:overlapping_dates, "The booking dates conflict with existing bookings")
			end
		end
   end

  def overlap?(x,y)
		(x.start_date - y.end_date) * (y.start_date - x.end_date) > 0
	end

	def check_max_num_guests
		max_num_guests = self.listing.max_num_guests
		return if self.num_guests < max_num_guests	
		self.errors.add(:max_num_guests,"Number of max guests exceeded")
	end

	def total_price
		price = self.listing.price
		num_dates = (self.start_date..self.end_date).to_a.length
		return price * num_dates
	end
end



#    before_create: check_date_availability

# def self.check_date_availability(booking_params)
#   bookings = Booking.where('start_date < ? OR end_date > ?', self.start_date, self.end_date)
#   return bookings.empty?
# end
# end
