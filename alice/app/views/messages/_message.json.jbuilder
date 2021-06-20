json.extract! message, :id, :txt, :sended_at, :received_at, :repeated_at, :state, :created_at, :updated_at
json.url message_url(message, format: :json)
