json.extract! photo_in_event, :id, :photo, :event, :created_at, :updated_at
json.url photo_in_event_url(photo_in_event, format: :json)
