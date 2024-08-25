# frozen_string_literal: true
require 'faker' 

FactoryBot.define do
  factory :user do
    email { 'user@gmail.com' }
    password { 'password' }
    # confirmed_at { Faker::Time.backward(days: 1) }
  end
end
