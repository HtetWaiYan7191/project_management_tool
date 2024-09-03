# frozen_string_literal: true

FactoryBot.define do
  factory :board do
    title { 'MyString' }
    association :company, factory: :company
    association :creator, factory: :user
  end
end
