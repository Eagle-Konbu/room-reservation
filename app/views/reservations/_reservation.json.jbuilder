json.extract! reservation, :id, :start_at, :end_at, :user_id, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
