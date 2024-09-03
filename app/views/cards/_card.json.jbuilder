json.extract! card, :id, :title, :due_date, :created_at, :updated_at
json.url card_url(card, format: :json)
