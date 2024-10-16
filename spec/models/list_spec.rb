# frozen_string_literal: true

require 'rails_helper'

RSpec.describe List, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:board) }
    it { should validate_presence_of(:title) }
  end

  describe 'associations' do
    it { should belong_to(:board) }
    it { should have_many(:cards) }
  end
end
