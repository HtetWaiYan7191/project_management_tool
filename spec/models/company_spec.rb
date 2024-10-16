# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Company, type: :model do
  it 'should create a valid company ' do
    company = build(:company)
    expect(company).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe 'associations' do
    it { should have_many(:departments) }
    it { should have_many(:annoucements) }
    it { should have_many(:users) }
    it { should have_many(:doc_and_files) }
    it { should have_many(:to_dos) }
  end
end
