json.extract! guest, :id, :name, :birthdate, :phone, :address_id, :gender, :father_name, :mother_name, :created_at, :updated_at
json.url guest_url(guest, format: :json)
