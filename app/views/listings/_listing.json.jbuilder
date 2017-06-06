json.extract! listing, :id, :user_id, :address1, :address2, :postal_code, :state, :country, :price, :room_type, :description, :availability, :bedroom, :bathroom, :created_at, :updated_at
json.url listing_url(listing, format: :json)
