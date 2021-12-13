json.extract! flower_type, :id, :name, :color, :growth_duration_seconds, :buy_price, :sell_price, :max_water_interval, :harvest_duration_seconds, :graphic, :created_at, :updated_at
json.url flower_type_url(flower_type, format: :json)
