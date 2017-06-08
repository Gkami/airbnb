class BookingMailer < ApplicationMailer
default from: 'customer@gmail.com'




	def booking_email(customer,host,booking_id)
		@customer = customer
		@host = host
		@booking_id = booking_id
		@url = 'http://localhost:3000/bookings/"#{@booking_id}"'
		mail(to: @host.email, subject: "You have a booking")

	end

end
