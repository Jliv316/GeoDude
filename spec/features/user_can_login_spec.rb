require 'rails_helper'

describe 'user visits home page' do
  context 'able to login' do
    it 'redirects to show page' do
      username = "jimboslice123"
      password = "password123"
      user = User.create(username: username, password: password)

      visit '/'

      click_on "Login"

      expect(current_path).to eq(login_path)

      fill_in "user[username]", with: "jimboslice123"
      fill_in "user[password]", with: "password123"

      click_on "Login"

      expect(page).to have_content("Welcome, jimboslice123!")
    end
  end
end