# frozen_string_literal: true

FactoryBot.define do
  factory :card do
    title { 'MyString' }
    list { nil }
    position { 1 }
    due_date { '2024-09-03' }
  end
end
