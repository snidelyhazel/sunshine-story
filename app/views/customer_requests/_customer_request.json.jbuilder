json.extract! customer_request, :id, :user_profile_id, :flower_type_id, :quantity, :created_at, :updated_at
json.url customer_request_url(customer_request, format: :json)
