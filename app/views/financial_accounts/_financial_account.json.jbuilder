json.extract! financial_account, :id, :bank, :account_name, :account_number, :agency, :description, :created_at, :updated_at
json.url financial_account_url(financial_account, format: :json)
