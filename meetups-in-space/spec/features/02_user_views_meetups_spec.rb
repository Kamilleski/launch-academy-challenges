require 'spec_helper'

# As a user
# I want to view a list of all available meetups
# So that I can get together with people with similar interests
# Acceptance Criteria:
#
# On the meetups index page, I should see the name of each meetup.
# Meetups should be listed alphabetically.

feature "User views meetups page" do
  let(:user) do
    User.create(
      provider: "github",
      uid: "1",
      username: "jarlax1",
      email: "jarlax1@launchacademy.com",
      avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400"
    )
  end

  let(:meetup_1) do
    Meetup.create(name: 'Music for Musical Peoples',
      description: 'All the musics.',
      location: 'Sunny SF',
      created_at: Date.today,
      updated_at: Date.today,
      creator: user)
  end

  let(:meetup_2) do
    Meetup.create(name: 'Moon Landings for Cheese Lovers',
      description: 'The moon is made of cheese, right?',
      location: 'The Moon',
      created_at: Date.today,
      updated_at: Date.today,
      creator: user)
  end

  let(:meetup_3) do
    Meetup.create(name: 'Apartments for less than $40k / Month',
      description: 'How to find the apartment of your dreams',
      location: 'Sunny SF',
      created_at: Date.today,
      updated_at: Date.today,
      creator: user)
  end

  scenario "User loads '/meetups' page while not authenticated" do
    meetup_1
    meetup_2
    meetup_3

    visit '/meetups'

    expect(page).to_not have_content 'Sunny SF'
    expect(page).to_not have_content 'All the musics'
    expect(page).to have_content 'Music for Musical Peoples'
    expect(page).to have_content 'Moon Landings for Cheese Lovers'
    expect(page).to have_content 'Apartments for less than $40k / Month'
  end

  scenario "User sees meetups in alphabetical order" do
    meetup_1
    meetup_2
    meetup_3

    visit '/meetups'

    expect(page).to have_selector("ul#meetup_list li:nth-child(1)", text: meetup_3.name)
    expect(page).to have_selector("ul#meetup_list li:nth-child(2)", text:meetup_2.name)
  end

  xscenario "User loads '/meetups' page while authenticated" do
  end
end
