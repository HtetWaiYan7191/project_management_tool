# frozen_string_literal: true

FactoryBot.define do
  factory :to_do do
    name { 'MyString' }
    association :company, factory: :company
  end
end
