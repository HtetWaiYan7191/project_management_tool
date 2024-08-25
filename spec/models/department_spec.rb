# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Department, type: :model do
  it 'should create a valid department' do
    department = build(:department)
    expect(department).to be_valid
  end

  it 'department should not have nil company' do
    department = build(:department, company_id: nil)
    expect(department).to_not be_valid
  end
end
