json.extract! owned_flower, :id, :user_profile_id, :flower_type_id, :quantity, :created_at, :updated_at
json.url owned_flower_url(owned_flower, format: :json)
