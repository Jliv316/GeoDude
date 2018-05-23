require 'rails_helper'

describe 'user visits home page' do
  context 'able to sign up' do
    it 'creates new user' do

      visit '/'

      click_on "Login/Sign Up"

      expect(current_path).to eq(new_user_path)

      fill_in "user[username]", with: "jimboslice123"
      fill_in "user[password]", with: "password123"

      click_on "Sign Up"

      expect(page).to have_content("Welcome, jimboslice123!")
    end
  end
end