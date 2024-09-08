require 'rails_helper'

RSpec.describe Event, type: :model do
  describe " validations "  do 
   it {should validate_presence_of(:title)}
   it {should validate_presence_of(:company)}
   it {should validate_presence_of(:description)}
   it {should validate_presence_of(:start_time)}
   it {should validate_presence_of(:end_time)}
   it {should validate_presence_of(:location)}
  end

  describe 'associations' do 
    it { should belong_to(:company) }
  end
end
