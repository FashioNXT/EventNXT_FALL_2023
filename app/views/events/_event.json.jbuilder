json.extract! event, :id, :title, :address, :description, :datetime, :last_modified, :created_at, :updated_at
json.url event_url(event, format: :json)
