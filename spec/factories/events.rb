FactoryBot.define do
  factory :event do
    title { "MyString" }
    association :company, factory: :company
    description { "MyString" }
    start_time { "2024-09-08 11:07:09" }
    end_time { "2024-09-08 11:07:09" }
    location { "MyString" }
  end
end
