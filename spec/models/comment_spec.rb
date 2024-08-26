# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do 
    it { should validate_presence_of(:user)}
    it { should validate_presence_of(:content)}
    it { should validate_presence_of(:commentable)}
  end

  describe 'associations' do 
    it {should belong_to(:user)}
    it {should belong_to(:commentable)}
  end

end
