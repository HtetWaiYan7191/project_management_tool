# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Board, type: :model do
  describe 'validations' do 
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:creator)}
    it {should validate_presence_of(:company)}
  end

  describe 'associations' do 
    it {should belong_to(:company)}
    it {should belong_to(:creator)}
    it {should have_many(:lists), dependent: :destroy}
    it {should have_and_belong_to_many(:assigned_users)}
  end
end
