class BookingMailer < ApplicationMailer
default from: 'sivanext248@gmail.com'




	def booking_email(customer,host,booking_id)
		@customer = customer
		@host = host
		@booking_id = booking_id
		@url = '<%= link_to "View Booking", booking_path(@booking_id) %>'
		mail(to: @customer.email, subject: "You have a booking")

	end

end
