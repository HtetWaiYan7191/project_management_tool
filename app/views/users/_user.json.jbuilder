# frozen_string_literal: true

json.extract! user, :id, :full_name, :avatar_url

json.sgid user.attachable_sgid
json.content render(partial: 'users/user', locals: { user: }, formats: [:html])
