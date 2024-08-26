# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:company) {create(:company)}
  let(:department) {create(:department)}
  
  describe 'validation' do  
    it { should validate_presence_of(:company) }
    it { should validate_presence_of(:department) }
    it { should validate_presence_of(:email) }
    it { should define_enum_for(:role) }
  end 

  describe 'associations' do 
    it {should belong_to(:department)}
    it {should belong_to(:company)}

    it {should have_many(:doc_and_files)}
    it {should have_many(:comments)}
    it {should have_many(:messages)}
  end
  
end
