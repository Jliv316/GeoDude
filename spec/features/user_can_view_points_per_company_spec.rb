require 'rails_helper'

describe 'logged in user visits /user/:id/companies ' do
  it 'displays the users companies' do
    addresses = ['415 S Cherokee St Unit 209','2155 N Downing St', '2900 E 16th Ave Unit 346', '2900 E 16th Ave Unit 439']
    user = User.create(username: "John", password: "password", role: 0)
    route1 = user.routes.create(start: addresses[0], finish: addresses[1])
    route2 = user.routes.create(start: addresses[0], finish: addresses[2])
    route3 = user.routes.create(start: addresses[2], finish: addresses[3])

    company1 = route1.companies.create(name: 'Target')
    company2 = route1.companies.create(name: 'Starbucks')
    company3 = route1.companies.create(name: 'Dicks Sporting Goods')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    click_on 'Points'

    expect(current_path).to eq(user_points_path(user))
    expect(page).to have_content(company1.name)
    expect(page).to have_content(company2.name)
    expect(page).to have_content(company3.name)
  end
end