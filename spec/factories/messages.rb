# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    user { nil }
    department { nil }
    content { 'MyText' }
    parent_message { nil }
  end
end
