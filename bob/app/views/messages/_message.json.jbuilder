json.extract! message, :id, :txt, :from, :created_at, :updated_at
json.url message_url(message, format: :json)
