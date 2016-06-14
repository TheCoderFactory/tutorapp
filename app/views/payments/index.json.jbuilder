json.array!(@payments) do |payment|
  json.extract! payment, :id, :user_id, :amount, :paid
  json.url payment_url(payment, format: :json)
end
