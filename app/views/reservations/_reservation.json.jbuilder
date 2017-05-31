json.extract! reservation, :id, :user_id, :listing_id, :check_in, :check_out, :no_guest, :comment, :total_price, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
