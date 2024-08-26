# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Annoucement, type: :model do
  it 'should create a valid annoucement' do
    annoucement = build(:annoucement)
    expect(annoucement).to be_valid
  end

  describe 'validations' do 
    it { should validate_presence_of(:user)}
    it { should validate_presence_of(:company)}
    it { should validate_presence_of(:title)}
    it { should validate_length_of(:title).is_at_least(3)}
    it { should validate_length_of(:title).is_at_most(50)}
  end

  describe 'associations' do 
    it {should belong_to(:user)}
    it {should belong_to(:company)}

    it { should have_rich_text(:content)}
    it { should have_and_belong_to_many(:departments) }
  end
end
