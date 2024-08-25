# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Annoucement, type: :model do
  it 'should create a valid annoucement' do
    annoucement = build(:annoucement)
    expect(annoucement).to be_valid
  end
end
