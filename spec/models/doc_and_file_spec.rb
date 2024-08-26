# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DocAndFile, type: :model do
  let(:company) {create(:company)}
  let(:department) {create(:department)}

  describe 'validations' do 
    it { should validate_presence_of(:company) }
    it { should validate_presence_of(:department) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_length_of(:description).is_at_least(4) }
    it { should validate_length_of(:description).is_at_most(50) }
  end

  describe 'associations' do 
    it { should belong_to(:company) }
    it { should belong_to(:department) }
    it {should belong_to(:user)}
    it { should have_many_attached(:files) }
  end
end
