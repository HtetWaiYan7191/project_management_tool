# frozen_string_literal: true

FactoryBot.define do
  factory :department do
    association :company, factory: :company
    name { 'MyString' }
  end
end
