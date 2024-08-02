json.extract! order, :id, :check_in_date, :check_out_date, :guest_id, :date, :payment_id, :created_at, :updated_at
json.url order_url(order, format: :json)
