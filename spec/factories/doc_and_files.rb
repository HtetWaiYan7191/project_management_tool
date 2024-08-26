# frozen_string_literal: true

FactoryBot.define do
  factory :doc_and_file do
    association :company, factory: :company
    association :department, factory: :department
    title { 'MyString' }
    description { 'MyString' }
  end
end
