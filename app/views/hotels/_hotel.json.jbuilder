json.extract! hotel, :id, :name, :cnpj, :phone, :manager, :created_at, :updated_at
json.url hotel_url(hotel, format: :json)
