json.extract! to_do_list, :id, :to_do_id, :creator_id, :name, :due_date, :note, :created_at, :updated_at
json.url to_do_list_url(to_do_list, format: :json)
