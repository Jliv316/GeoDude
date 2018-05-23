require 'rails_helper'

describe Company, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:name)}
  end

  describe 'relationships' do
    it {should belong_to(:route)}
    it {should have_many(:points)}
  end
end