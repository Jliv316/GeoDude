require 'rails_helper'

describe 'logged in user visits /user/:id ' do
  context 'clicks on routes' do
    it 'displays the users specific routes' do
      user = User.create(username: "John", password: "password", role: 0)
      route1 = user.routes.create(street: 'Blake st')
      route2 = user.routes.create(street: 'Larimer st')
      route3 = user.routes.create(street: 'Market st')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)

      click_on 'Routes'

      expect(current_path).to eq(user_routes_path(user))
      expect(page).to have_content(route1.street)
      expect(page).to have_content(route2.street)
      expect(page).to have_content(route3.street)
    end
  end
end