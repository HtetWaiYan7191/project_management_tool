# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Company, type: :model do
  it 'should create a valid company ' do
    company = build(:company)
    expect(company).to be_valid
  end
end
