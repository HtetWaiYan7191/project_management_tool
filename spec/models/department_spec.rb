# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Department, type: :model do
  it 'should create a valid department' do
    department = build(:department)
    expect(department).to be_valid
  end

  describe 'validations' do 
    it { should validate_presence_of(:company) }
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do 
    it { should have_many(:doc_and_files) }
    it { should have_many(:users) }
    it { should have_many(:messages) }
  end
end
