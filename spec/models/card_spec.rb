# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Card, type: :model do
  describe 'validations' do 
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:list)}
  end

  describe 'associations' do 
    it {should belong_to(:list)}
    it {should have_rich_text(:description)}
    it {should have_and_belong_to_many(:assigned_users)}
  end

end
