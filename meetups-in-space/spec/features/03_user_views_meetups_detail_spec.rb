require 'spec_helper'

# As a user
# I want to view the details of a meetup
# So that I can learn more about its purpose
# Acceptance Criteria:
#
# On the index page, the name of each meetup should be a link to the meetup's show page.
# On the show page, I should see the name, description, location, and
# the creator of the meetup.


feature "User can access a meetup detail page" do
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

  scenario "User loads '/meetups' page and clicks link to details" do
    meetup_1
    meetup_2
    meetup_3

    visit '/meetups'
    click_link 'Music for Musical Peoples'

    expect(page).to have_content 'Music for Musical Peoples'
    expect(page).to have_content 'All the musics.'
    expect(page).to have_content 'Sunny SF'
    expect(page).to_not have_content 'The Moon'
    expect(page).to_not have_content "Here's your meetup!"
  end

  xscenario "Meetup details page has info on creator" do
  end
end
