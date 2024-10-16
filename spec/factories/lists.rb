# frozen_string_literal: true

FactoryBot.define do
  factory :list do
    title { 'MyString' }
    association :board, factory: :board
    position { 1 }
  end
end
