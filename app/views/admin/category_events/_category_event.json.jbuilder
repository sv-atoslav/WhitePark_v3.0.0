json.extract! category_event, :id, :title, :description, :icon, :created_at, :updated_at
json.url category_event_url(category_event, format: :json)
