json.extract! event, :id, :category, :title, :description, :icon, :created_at, :updated_at
json.url event_url(event, format: :json)
