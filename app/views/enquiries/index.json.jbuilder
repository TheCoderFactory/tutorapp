json.array!(@enquiries) do |enquiry|
  json.extract! enquiry, :id, :email, :name, :phone, :body, :user_id
  json.url enquiry_url(enquiry, format: :json)
end
