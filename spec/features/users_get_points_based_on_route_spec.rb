require 'rails_helper'

describe 'logged in user visits /user/:id ' do
  context 'clicks on points' do
    it 'displays the users points per company' do
      addresses = ['415 S Cherokee St Unit 209','2155 N Downing St', '2900 E 16th Ave Unit 346', '2900 E 16th Ave Unit 439']
      user = User.create(username: "John", password: "password", role: 0)
      
      route1 = user.routes.create(start: addresses[0], finish: addresses[1])
      route2 = user.routes.create(start: addresses[0], finish: addresses[2])
      route3 = user.routes.create(start: addresses[2], finish: addresses[3])

      company1 = route1.companies.create(name: 'Target')
      company2 = route1.companies.create(name: 'Starbucks')
      company3 = route1.companies.create(name: 'Dicks Sporting Goods')
      company4 = route2.companies.create(name: 'Dicks Sporting Goods')

      work_route = "#{route1.start} --> #{route1.finish}"
      school_route = "#{route2.start} --> #{route2.finish}"
      gym_route = "#{route3.start} --> #{route3.finish}"

      user_points = user.generate_points

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)

      click_on 'Points'
      save_and_open_page
      
      expect(current_path).to eq(user_points_path(user))
      expect(page).to have_content(user_points.length)
    end
  end
end
