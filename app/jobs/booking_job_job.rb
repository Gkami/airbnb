class BookingJobJob < ApplicationJob
  queue_as :default

  def perform(booking, listing)
    BookingMailer.booking_email(booking.user,listing.user,booking.id).deliver_now
  end
end
