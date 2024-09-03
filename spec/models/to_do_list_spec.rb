# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ToDoList, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:to_do) }
    it { should validate_presence_of(:creator) }
    # it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(50) }
  end

  describe 'associations' do
    it { should belong_to(:to_do) }
    it { should belong_to(:creator) }
    it { should have_and_belong_to_many(:assigned_users).dependent(:destroy) }
  end
end
