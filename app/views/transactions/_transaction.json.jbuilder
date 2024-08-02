json.extract! transaction, :id, :execution_date, :transaction_type, :payment_id, :description, :payment_method_id, :financial_account_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
