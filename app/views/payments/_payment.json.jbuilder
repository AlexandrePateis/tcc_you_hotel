json.extract! payment, :id, :date, :entry_date, :execution_date, :order_id, :created_at, :updated_at
json.url payment_url(payment, format: :json)
