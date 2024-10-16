# frozen_string_literal: true

FactoryBot.define do
  factory :to_do_list do
    to_do { nil }
    association :creator, factory: :user
    name { 'MyString' }
    due_date { '2024-08-30' }
    note { 'MyString' }
  end
end
