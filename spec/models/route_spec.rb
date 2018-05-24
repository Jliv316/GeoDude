require 'rails_helper'

describe Route, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:start)}
    it {should validate_presence_of(:finish)}
  end

  describe 'relationships' do
    it {should have_many(:companies)}
    it {should have_many(:users).through(:user_routes)}
  end
end
