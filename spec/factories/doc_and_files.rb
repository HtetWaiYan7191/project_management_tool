# frozen_string_literal: true

FactoryBot.define do
  factory :doc_and_file do
    company { nil }
    department { nil }
    title { 'MyString' }
    description { 'MyString' }
  end
end
