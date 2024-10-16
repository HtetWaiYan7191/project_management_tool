# frozen_string_literal: true

FactoryBot.define do
  factory :annoucement do
    association :user, factory: :user
    association :company, factory: :company
    title { 'MyString' }
    is_all_department { false }
  end
end
