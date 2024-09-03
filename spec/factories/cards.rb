# frozen_string_literal: true

FactoryBot.define do
  factory :card do
    title { 'MyString' }
    association :list, factory: :list
    position { 1 }
    due_date { '2024-09-03' }
  end
end
