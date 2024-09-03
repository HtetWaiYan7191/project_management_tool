# frozen_string_literal: true

FactoryBot.define do
  factory :step do
    title { 'MyString' }
    card { nil }
    due_date { '2024-09-03' }
  end
end
