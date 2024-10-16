# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Step, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
  end

  describe 'associations' do
    it { should belong_to(:card) }
    it { should have_and_belong_to_many(:assigned_users), dependent: :destroy }
  end
end
