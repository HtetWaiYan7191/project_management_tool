# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    user { nil }
    content { 'MyText' }
    commentable { nil }
  end
end
