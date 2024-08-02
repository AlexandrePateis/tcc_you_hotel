json.extract! address, :id, :street, :city, :state, :zip, :country, :neighborhood, :created_at, :updated_at
json.url address_url(address, format: :json)
