require 'rails_helper'

describe Point, type: :model do
  describe 'realationships' do
    it {should belong_to(:user)}
    it {should belong_to(:company)}
  end
end