require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:username)}
    it {should validate_uniqueness_of(:username)}
    it {should validate_presence_of(:password)}
  end

  describe 'relationships' do
    it {should have_many(:points)}
    it {should have_many(:routes).through(:user_routes)}
  end
end