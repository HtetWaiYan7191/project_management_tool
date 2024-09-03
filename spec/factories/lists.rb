# frozen_string_literal: true

FactoryBot.define do
  factory :list do
    title { 'MyString' }
    board { nil }
    position { 1 }
  end
end
