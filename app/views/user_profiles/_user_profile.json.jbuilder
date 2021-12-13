json.extract! user_profile, :id, :user_name, :sun_penny, :last_update, :created_at, :updated_at
json.url user_profile_url(user_profile, format: :json)
