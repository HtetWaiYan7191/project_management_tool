# frozen_string_literal: true

json.extract! annoucement, :id, :user_id, :company_id, :title, :is_all_department, :created_at, :updated_at
json.url annoucement_url(annoucement, format: :json)
