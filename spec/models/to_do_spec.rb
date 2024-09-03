# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ToDo, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:company) }
    it { should validate_length_of(:name).is_at_most(20) }
  end

  describe 'associations' do
    it { should belong_to(:company) }
    it { should have_many(:to_do_lists).dependent(:destroy) }
  end
end
